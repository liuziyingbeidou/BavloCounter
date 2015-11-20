package com.bavlo.counter.httpclient;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.security.SecureRandom;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.bavlo.weixin.qiye.enums.EnumMethod;
import com.bavlo.weixin.qiye.util.MyX509TrustManager;

/**
 * @Title: ����Counter
 * @ClassName: HttpTools 
 * @Description: java HttpClient URL
 * @author liuzy
 * @date 2015-10-21 ����05:00:11
 */
public class HttpTools
{

	/**
	 * @param args
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public static String getDataByURL(String url)
	{
		//url = "http://www.bavlo.com/getGemCalibrated?typeId=3&shapeId=4";
		String res = null;
		// ����HttpClientʵ��   
	    HttpClient httpclient = new DefaultHttpClient();
	    // ����Get����ʵ��   
        HttpGet httpgets = new HttpGet(url);  
        HttpResponse response;
        try {
			response = httpclient.execute(httpgets);
	        HttpEntity entity = response.getEntity();  
	        if (entity != null) {  
	            InputStream instreams = entity.getContent();  
	            String str = convertStreamToString(instreams);
	            res = str;
	            httpgets.abort();  
	        }
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}  
		return res;
	}
	
	public static String convertStreamToString(InputStream is) {    
		StringBuilder sb1 = new StringBuilder();      
        byte[] bytes = new byte[4096];    
        int size = 0;    
          
        try {      
            while ((size = is.read(bytes)) > 0) {    
                String str = new String(bytes, 0, size, "UTF-8");    
                sb1.append(str);    
            }    
        } catch (IOException e) {      
            e.printStackTrace();      
        } finally {      
            try {      
                is.close();      
            } catch (IOException e) {      
               e.printStackTrace();      
            }      
        }      
        return sb1.toString();       
    }
	
	/**
	 * ����https���󲢻�ȡ���
	 * 
	 * @param requestUrl �����ַ
	 * @param requestMethod ����ʽ��GET��POST��
	 * @param outputStr �ύ������
	 * @return JSONObject(ͨ��JSONObject.get(key)�ķ�ʽ��ȡjson���������ֵ)
	 */
	public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {
		
		System.err.println(requestMethod+"\toutputStr="+outputStr);
		
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// ����SSLContext���󣬲�ʹ������ָ�������ι�������ʼ��
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// ������SSLContext�����еõ�SSLSocketFactory����
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// ��������ʽ��GET/POST��
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// ����������Ҫ�ύʱ
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// ע������ʽ����ֹ��������
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// �����ص�������ת�����ַ���
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// �ͷ���Դ
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.fromObject(buffer.toString());
			//System.out.println("jsonObject="+jsonObject);
		} catch (ConnectException ce) {
			ce.printStackTrace();
			System.out.println("��������ʧ�ܣ�");
		}catch (UnknownHostException uhe) {
			uhe.printStackTrace();
			System.out.println("API�޷�����....��");
			//httpRequest(requestUrl, requestMethod, outputStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	/**
	 * ����https���󲢻�ȡ�ֽ�������
	 * @param requestUrl
	 * @param requestMethod
	 * @param data
	 * @return
	 */
	public static byte[] httpRequest_byte(String requestUrl, String requestMethod, byte[] data) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try {
			if (requestMethod == EnumMethod.GET.name() && data != null && data.length > 0) {
				if (requestUrl.indexOf('?') > 0) {
					requestUrl += '&';
				} else {
					requestUrl += '?';
				}
				requestUrl += new String(data);
			}
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			if (httpUrlConn instanceof HttpsURLConnection) {
				// ����SSLContext���󣬲�ʹ������ָ�������ι�������ʼ��
				TrustManager[] tm = { new MyX509TrustManager() };
				SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
				sslContext.init(null, tm, new SecureRandom());
				// ������SSLContext�����еõ�SSLSocketFactory����
				SSLSocketFactory ssf = sslContext.getSocketFactory();
				((HttpsURLConnection) httpUrlConn).setSSLSocketFactory(ssf);
			}
			boolean truePost = requestMethod == EnumMethod.POST.name() && data != null && data.length > 0;
			httpUrlConn.setDoOutput(truePost);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// ��������ʽ��GET/POST��
			httpUrlConn.setRequestMethod(requestMethod);

			if (requestMethod == EnumMethod.GET.name()) {
				httpUrlConn.connect();
			} else if (truePost) {
				// �ύ����
				OutputStream outputStream = httpUrlConn.getOutputStream();
				outputStream.write(data);
				outputStream.close();
			}

			// ��ȡ��������
			InputStream inputStream = httpUrlConn.getInputStream();
			byte[] buf = new byte[1024 * 2];
			int len;
			while ((len = inputStream.read(buf)) != -1) {
				out.write(buf, 0, len);
			}
			// �ͷ���Դ
			out.close();
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
		} catch (ConnectException ce) {
		} catch (Exception e) {
		}
		return out.toByteArray();
	}
	
	 /**
	  * java.netʵ�� HTTP POST�����ύ
	  *
	  * @param url
	  * @param paramContent
	  * @return
	  */
	 public static StringBuffer submitPost(String url, String paramContent) {
	  StringBuffer responseMessage = null;
	  java.net.URLConnection connection = null;
	  java.net.URL reqUrl = null;
	  OutputStreamWriter reqOut = null;
	  InputStream in = null;
	  BufferedReader br = null;
	  String param = paramContent;
	  try {

	   System.out.println("url=" + url + "?" + paramContent + "\n");
	   System.out.println("===========post method start=========");
	   responseMessage = new StringBuffer();
	   reqUrl = new java.net.URL(url);
	   connection = reqUrl.openConnection();
	   connection.setDoOutput(true);
	   reqOut = new OutputStreamWriter(connection.getOutputStream());
	   reqOut.write(param);
	   reqOut.flush();
	   int charCount = -1;
	   in = connection.getInputStream();

	   br = new BufferedReader(new InputStreamReader(in, "utf-8"));
	   while ((charCount = br.read()) != -1) {
	    responseMessage.append((char) charCount);
	   }

	   System.out.println(responseMessage);
	   System.out.println("===========post method end=========");
	  } catch (Exception ex) {
	   System.out
	     .println("url=" + url + "?" + paramContent + "\n e=" + ex);
	  } finally {
	   try {
	    in.close();
	    reqOut.close();
	   } catch (Exception e) {
	    System.out
	      .println("paramContent=" + paramContent + "|err=" + e);
	   }

	  }
	  return responseMessage;
	 }

	 /**
	  * java.netʵ�� HTTP��HTTPs GET�����ύ
	  *
	  * @param strUrl
	  *            �ύ�ĵ�ַ������
	  * @return ���ص�response��Ϣ
	  */
	 public static String submitGet(String strUrl) {
	  URLConnection connection = null;
	  BufferedReader reader = null;
	  String str = null;
	  try {
	   System.out.println("send getmethod=" + strUrl);
	   URL url = new URL(strUrl);
	   connection = url.openConnection();
	   connection.setDoInput(true);
	   connection.setDoOutput(false);
	   // ȡ������������ʹ��Reader��ȡ
	   reader = new BufferedReader(new InputStreamReader(connection
	     .getInputStream()));
	   System.out
	     .println("============Contents of get request===============");
	   String lines;
	   StringBuffer linebuff = new StringBuffer("");
	   while ((lines = reader.readLine()) != null) {
	    linebuff.append(lines);
	   }
	   System.out.println(linebuff);
	   System.out
	     .println("============Contents of get request ends==========");
	   str = linebuff.toString();
	  } catch (Exception e) {
	   System.out.println("getmethod is err=" + e);
	   e.printStackTrace();
	  } finally {
	   try {
	    reader.close();
	   } catch (Exception e) {
	    e.printStackTrace();
	   }
	  }
	  return str;
	 }
}