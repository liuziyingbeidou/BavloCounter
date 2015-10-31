package com.bavlo.counter.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Title: 宝珑Counter
 * @ClassName: UploadController 
 * @Description: 文件上传
 * @author liuzy
 * @date 2015-10-31 下午08:24:04
 */
@Controller("uploadController")
@RequestMapping(value = "/upload")
public class UploadController extends BaseController {

	Logger log = Logger.getLogger(UploadController.class);
	
	@RequestMapping("/uploadFile")
    public void uploadHeadPic(@RequestParam("file")MultipartFile file,HttpServletRequest request,HttpServletResponse response){
        try {
        	//上传模块
        	String model = request.getParameter("filemodel");
        	String type = request.getParameter("filetype");
            super.upload(file,type, "/"+model+"/",request);
            renderText(super.getfName());
        } catch (Exception e) {
            e.printStackTrace();
        }
   }
}
