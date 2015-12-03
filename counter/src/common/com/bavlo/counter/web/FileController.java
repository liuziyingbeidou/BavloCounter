package com.bavlo.counter.web;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.utils.CommonUtils;

@Controller("fileController")
@RequestMapping(value = "/file")
public class FileController extends BaseController implements ServletContextAware{
	//Spring������ͨ��ʵ��ServletContextAware�ӿ���ע��ServletContext����  
    private ServletContext servletContext; 
	
    /**
     * @Description: ����
     * @param @param filePath ģ��洢·�� eg��entitysign
     * @param @param fileName �ļ��� eg:2015120200909.jpg
     * @param @param request
     * @param @param response
     * @param @return
     * @return String
     */
    @RequestMapping("/download")
    public String download(String filePath,String fileName, HttpServletRequest request,
            HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName="
                + fileName);
        
        if(CommonUtils.isNull(fileName) || CommonUtils.isNull(filePath)){
        	renderText("�ļ�������!");
        	return null;
        }
        
        try {
        	String basePath = servletContext.getRealPath("/");  
            String path = basePath +"/"+IConstant.FILE_DIR+"//"+filePath;//���downloadĿ¼Ϊɶ������classes�µ�
            InputStream inputStream = new FileInputStream(new File(path
                    + File.separator + fileName));
 
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
 
             // ������Ҫ�رա�
            os.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            renderText("�ļ�������!");
        } catch (IOException e) {
            e.printStackTrace();
            renderText("�����쳣!");
        }
            //  ����ֵҪע�⣬Ҫ��Ȼ�ͳ�������������
            //java+getOutputStream() has already been called for this response
        return null;
    }
    
    @Override  
    public void setServletContext(ServletContext servletContext) {  
        this.servletContext = servletContext;  
    }  
}
