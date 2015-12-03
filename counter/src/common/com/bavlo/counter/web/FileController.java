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
	//Spring这里是通过实现ServletContextAware接口来注入ServletContext对象  
    private ServletContext servletContext; 
	
    /**
     * @Description: 下载
     * @param @param filePath 模块存储路径 eg：entitysign
     * @param @param fileName 文件名 eg:2015120200909.jpg
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
        	renderText("文件不存在!");
        	return null;
        }
        
        try {
        	String basePath = servletContext.getRealPath("/");  
            String path = basePath +"/"+IConstant.FILE_DIR+"//"+filePath;//这个download目录为啥建立在classes下的
            InputStream inputStream = new FileInputStream(new File(path
                    + File.separator + fileName));
 
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
 
             // 这里主要关闭。
            os.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            renderText("文件不存在!");
        } catch (IOException e) {
            e.printStackTrace();
            renderText("下载异常!");
        }
            //  返回值要注意，要不然就出现下面这句错误！
            //java+getOutputStream() has already been called for this response
        return null;
    }
    
    @Override  
    public void setServletContext(ServletContext servletContext) {  
        this.servletContext = servletContext;  
    }  
}
