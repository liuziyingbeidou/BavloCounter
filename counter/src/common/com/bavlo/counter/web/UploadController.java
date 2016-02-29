package com.bavlo.counter.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
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
import com.bavlo.counter.service.ICommonService;
import com.bavlo.counter.utils.ImageUtils;
import com.bavlo.counter.utils.ReadFile;
import com.bavlo.counter.utils.StringUtil;

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
	
	@Resource
	ICommonService commonService;

	Logger log = Logger.getLogger(UploadController.class);
	
	@RequestMapping("/uppage")
	public ModelAndView upPage(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_UPLOAD);
		
		return model;
	}
	
	/*@RequestMapping("/showpic")
	public ModelAndView showPic(HttpServletRequest request){
		String id = request.getParameter("id");
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_SHOWPIC);
		if(StringUtil.isNotEmpty(id)){
			List<GemSignBVO> listbvo = gemSignService.findListGemB(Integer.valueOf(id));
			model.addObject("listbvo", listbvo);
		}
		return model;
	}
	
	@RequestMapping("/showpicE")
	public ModelAndView showPicE(HttpServletRequest request){
		String id = request.getParameter("id");
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_SHOWPIC);
		if(StringUtil.isNotEmpty(id)){
			List<EntitySignBVO> listbvo = entitySignService.findListEntityB(Integer.valueOf(id));
			model.addObject("listbvo", listbvo);
		}
		return model;
	}*/
	
	@RequestMapping("/showpic")
	public ModelAndView showPic(HttpServletRequest request){
		String id = request.getParameter("id");//外键值
		String table = request.getParameter("cpath");//表
		String fkey = request.getParameter("fkey");//外键
		String ptype = request.getParameter("ptype");//类别字段
		String vtype = request.getParameter("vtype");//类别字段值
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_SHOWPIC);
		
		String wh = null;
		if(id != null){
			wh = fkey+"="+id;
			if(StringUtil.isNotEmpty(ptype) && StringUtil.isNotEmpty(vtype)){
				wh += " and "+ptype+"='"+vtype+"'";
			}
		}else{
			wh = "1=2";
		}
		
		try {
			Class cls = Class.forName(table);
			if(StringUtil.isNotEmpty(id)){
				List list = commonService.findAll(cls, wh);
				model.addObject("listbvo", list);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return model;
	}
	
	@RequestMapping("/shownpic")
	public ModelAndView shownPic(HttpServletRequest request){
		String frmId = request.getParameter("frmId");//form id
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_SHOWNPIC);
		model.addObject("frmId", frmId);
		
		return model;
	}
	
	@RequestMapping("/showpicJson")
	public void showPicJson(HttpServletRequest request){
		String id = request.getParameter("id");//外键值
		String table = request.getParameter("cpath");//表
		String fkey = request.getParameter("fkey");//外键
		ModelAndView model = new ModelAndView(IConstant.PATH_COMMON + IConstant.COMMON_SHOWPIC);
		
		try {
			Class cls = Class.forName(table);
			if(StringUtil.isNotEmpty(id)){
				List list = commonService.findAll(cls, fkey+"="+id,null,"biscover","desc");
				renderJson(list);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadSGFile")
	public void uploadFile(@RequestParam("sfile") MultipartFile sfile,HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		uploadHeadPic(sfile,request,response);
	}
	
	@RequestMapping("/delSGFile")
	public void delFileByName(HttpServletRequest request,String fileName){
		String filePath = "D:\\FTP\\apache-tomcat-6.0.32-counter\\webapps\\counter\\staticRes\\custom";
		try {
			ReadFile.deletefile(filePath+"\\"+fileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description: 删除已上传图片
	 * @param @param request
	 * @param @param fileModel 模块  eg： custom or custom
	 * @param @param fileName 文件名称
	 * @return void
	 */
	@RequestMapping("/delPic")
	public void delPicByName(HttpServletRequest request,String fileModel,String fileName){
		String filePath = "D:\\FTP\\apache-tomcat-6.0.32-counter\\webapps\\counter\\staticRes";
		try {
			ReadFile.deletefile(filePath+"\\"+fileModel+"\\"+fileName);//原图
			
			String minFileName = null;
	        int index = fileName.lastIndexOf(".");
	        if (index != -1) {
	        	minFileName = fileName.substring(0, index) + "_min" + fileName.substring(index);
	        } else {
	        	minFileName = fileName+"_min.jpg";
	        }
			ReadFile.deletefile(filePath+"\\"+fileModel+"\\min\\"+minFileName);//小图
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadFile")
    public void uploadHeadPic(@RequestParam("file")MultipartFile file,HttpServletRequest request,HttpServletResponse response){
        try {
        	//上传模块
        	String model = request.getParameter("filemodel");
        	String type = request.getParameter("filetype");
            String picName = super.upload(file,type, "/"+model+"/",request);
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
            response.getWriter().print(picName);
            response.getWriter().close();
            System.out.println(picName);
        } catch (Exception e) {
            e.printStackTrace();
        }
   }
}
