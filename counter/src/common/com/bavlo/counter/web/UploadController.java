package com.bavlo.counter.web;

import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.utils.ImageUtils;

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
	
	@RequestMapping("/uppage")
	public ModelAndView upPage(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_UPLOAD);
		
		return model;
	}
	
	@RequestMapping("/uploadFile")
    public void uploadHeadPic(@RequestParam("file")MultipartFile file,HttpServletRequest request,HttpServletResponse response){
        try {
        	//上传模块
        	String model = request.getParameter("filemodel");
        	String type = request.getParameter("filetype");
            super.upload(file,type, "/"+model+"/",request);
            File originalImage = new File(getSrcFilePath());
            if(IConstant.RES_TYPE_PIC.equals(type)){
            	File destFile = new File(getMinFilePath());
                if(!destFile.exists()){
                    destFile.mkdirs();
                }
                String uploadFileName = getfName();
                String minFileName = null;
		        int index = uploadFileName.lastIndexOf(".");
		        if (index != -1) {
		        	minFileName = uploadFileName.substring(0, index) + "_min" + uploadFileName.substring(index);
		        } else {
		        	minFileName = uploadFileName+"_min.jpg";
		        }
            	byte[] bytes = ImageUtils.resize(ImageIO.read(originalImage), 330, 1f, true);
                FileOutputStream out = new FileOutputStream(new File(getMinFilePath()+ "/" +minFileName));
                out.write(bytes);
                out.close();
            }
            response.getWriter().print(super.getfName());
        } catch (Exception e) {
            e.printStackTrace();
        }
   }
}
