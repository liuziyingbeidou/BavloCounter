package com.bavlo.counter.utils;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bavlo.counter.constant.IConstant;

/**
 * @Title: 宝珑Counter
 * @ClassName: UploadHelper 
 * @Description: 上传帮助类
 * @author liuzy
 * @date 2015-10-31 下午04:14:37
 */
public class UploadHelper {
    private String allowSuffix = "jpg,png,gif,jpeg";//允许文件格式
    private long allowSize = 2L;//允许文件大小
    private String fileName;//文件名(包含完整路径)
    private String model;//文件上传模块
    private String fName;//文件名(包含扩展名)
    
    private String filePath;
    
    public String getAllowSuffix() {
        return allowSuffix;
    }
 
    public void setAllowSuffix(String allowSuffix) {
        this.allowSuffix = allowSuffix;
    }
 
    public long getAllowSize() {
        return allowSize*1024*1024;
    }
 
    public void setAllowSize(long allowSize) {
        this.allowSize = allowSize;
    }
 
    public String getFileName() {
        return fileName;
    }
 
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
 
    public String getModel() {
		return StringUtil.isEmpty(model) ? IConstant.FILE_MODEL : model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	//上传文件目录
	public String getStaticDir() {
		return IConstant.FILE_DIE;
	}

    public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/**
     * @Description: 重新命名文件
     * @param @return
     * @return String
     */
    private String getFileNameNew(){
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        Random random = new Random();
    	String randomCode = "";
    	for ( int i = 0; i < 6; i++ )
    	{
    		randomCode += Integer.toString(random.nextInt(36), 36);
    	}
        return fmt.format(new Date()) + randomCode;
    }
	/**
	 * @descrption 根据HttpServletRequest对象获取MultipartFile集合
	 * @author xdwang
	 * @create 2012-11-19下午5:11:41
	 * @param request
	 * @param maxLength
	 *            文件最大限制
	 * @param allowExtName
	 *            不允许上传的文件扩展名
	 * @return MultipartFile集合
	 */
	public static List<MultipartFile> getFileSet(HttpServletRequest request,
			long maxLength, String[] allowExtName) {
		MultipartHttpServletRequest multipartRequest = null;
		try {
			multipartRequest = (MultipartHttpServletRequest) request;
		} catch (Exception e) {
			return new LinkedList<MultipartFile>();
		}

		List<MultipartFile> files = new LinkedList<MultipartFile>();
		files = multipartRequest.getFiles("attach");
		// 移除不符合条件的
		for (int i = 0; i < files.size(); i++) {
			if (!validateFile(files.get(i), maxLength, allowExtName)) {
				files.remove(files.get(i));
				if (files.size() == 0) {
					return files;
				}
			}
		}
		return files;
	}

	/**
	 * @descrption 保存文件
	 * @author xdwang
	 * @create 2012-11-19下午4:17:36
	 * @param file
	 *            MultipartFile对象
	 * @param path
	 *            保存路径，如“D:\\File\\”
	 * @return 保存的全路径 如“D:\\File\\2345678.txt”
	 * @throws Exception
	 *             文件保存失败
	 */
	public static String uploadFile(MultipartFile file, String path)
			throws Exception {

		String filename = file.getOriginalFilename();
		String extName = filename.substring(filename.lastIndexOf("."))
				.toLowerCase();
		String lastFileName = UUID.randomUUID().toString() + extName;
		if (!path.endsWith(File.separator)) {
			path = path + File.separator;
		}
		File temp = new File(path);
		if (!temp.isDirectory()) {
			temp.mkdir();
		}
		// 图片存储的全路径
		String fileFullPath = path + lastFileName;
		FileCopyUtils.copy(file.getBytes(), new File(fileFullPath));
		return fileFullPath;
	}

	/**
	 * @descrption 验证文件格式，这里主要验证后缀名
	 * @author xdwang
	 * @create 2012-11-19下午4:08:12
	 * @param file
	 *            MultipartFile对象
	 * @param maxLength
	 *            文件最大限制
	 * @param allowExtName
	 *            不允许上传的文件扩展名
	 * @return 文件格式是否合法
	 */
	private static boolean validateFile(MultipartFile file, long maxLength,
			String[] allowExtName) {
		if (file.getSize() < 0 || file.getSize() > maxLength)
			return false;
		String filename = file.getOriginalFilename();

		// 处理不选择文件点击上传时，也会有MultipartFile对象，在此进行过滤
		if (filename == "") {
			return false;
		}
		String extName = filename.substring(filename.lastIndexOf("."))
				.toLowerCase();
		if (allowExtName == null || allowExtName.length == 0
				|| Arrays.binarySearch(allowExtName, extName) != -1) {
			return true;
		} else {
			return false;
		}
	}
	
    /**
     * @Description: 文件上传 
     * @param @param file
     * @param @param destDir 模块
     * @param @param request
     * @param @throws Exception
     * @return void
     */
    public void upload(MultipartFile file,String fileType, String destDir,HttpServletRequest request) throws Exception {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
        try {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
                int length = getAllowSuffix().indexOf(suffix);
                if(length == -1){
                    throw new Exception("请上传允许格式的文件");
                }
                if(file.getSize() > getAllowSize()){
                    throw new Exception("您上传的文件大小已经超出范围");
                }
                if(StringUtil.isEmpty(destDir)){
                	destDir = getStaticDir() + getModel();
                }else{
                	destDir = getStaticDir() + destDir;
                }
                String realPath = request.getSession().getServletContext().getRealPath("/");
                File destFile = new File(realPath+destDir+"/min/");
                if(!destFile.exists()){
                    destFile.mkdirs();
                }
                String fileNameNew = getFileNameNew()+"."+suffix;
                File f = new File(destFile.getAbsoluteFile()+"/"+fileNameNew);
                file.transferTo(f);
                f.createNewFile();
                fileName = basePath+destDir+fileNameNew;
                fName = fileNameNew;
                if(IConstant.RES_TYPE_PIC.equals(fileType)){
                	setFilePath(basePath+destDir);
                	toZoom(f);
                }
        } catch (Exception e) {
            throw e;
    }
}
	
	   /**
	    * @Description: 高清晰生成缩略图
	    * @param 
	    * @return void
	     * @throws IOException 
	     */
	    public void toZoom(File getUpload) throws IOException{
	    	String minFileName = null;
	    	
	    	BufferedImage srcBufferImage = ImageIO.read(getUpload);
	    	BufferedImage scaledImage;
	    	ScaleImage scaleImage = ScaleImage.getInstance();
			int yw = srcBufferImage.getWidth();
			int yh = srcBufferImage.getHeight();
			int w = 80, h = 80;
			
			String uploadFileName = getfName();
	        int index = uploadFileName.lastIndexOf(".");
	        if (index != -1) {
	        	minFileName = uploadFileName.substring(0, index) + "_min" + uploadFileName.substring(index);
	        } else {
	        	minFileName = uploadFileName+"_min";
	        }
	    	
	     // 如果上传图片 宽高 比 压缩的要小 则不压缩
			if (w > yw && h > yh)
			{
				FileOutputStream fos = new FileOutputStream(getFilePath() + "/" + minFileName);

				FileInputStream fis = new FileInputStream(getUpload);
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0)
				{
					fos.write(buffer, 0, len);
				}
			}
			else
			{
				scaledImage = scaleImage.imageZoomOut(srcBufferImage, w, h);
				FileOutputStream out = new FileOutputStream(getFilePath() + "/" + minFileName);
				ImageIO.write(scaledImage, "jpeg", out);
			}
	    	
	    }

}

