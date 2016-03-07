package com.bavlo.counter.web.remote;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.manage.tools.SharePicVO;
import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.JsonUtils;
import com.bavlo.counter.utils.ReadFile;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.fuwu.util.AdvancedUtil;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;
import com.bavlo.weixin.qiye.interceptor.OAuthRequired;

@Controller("remoteController")
@RequestMapping(value = "/remote")
public class RemoteController extends BaseController implements ServletContextAware{

	@Resource
	IToolsService toolsService;
	
	private ServletContext servletContext; 
	
	@RequestMapping(value = "/loginInfo2/{id}", method = RequestMethod.GET)
	@OAuthRequired
	public void getLoginInfo(@PathVariable Long id,HttpServletRequest request,HttpServletResponse response){
		Object loginInfo = session.getAttribute("loginInfo");
		System.out.println(loginInfo);
	}
	
	@RequestMapping(value = "/loginInfo", method = RequestMethod.GET)
	@OAuthRequired
	public void getLoginInfo(HttpServletRequest request,HttpServletResponse response){
		Object loginInfo = session.getAttribute("loginInfo");
		renderJson(JsonUtils.getJsonString4JavaPOJO(loginInfo));
	}
	
	
	/**以下提供支持虚拟试戴分享**/
	
	/**
	 * url:所要分享的图片URL
	 * LG：将URL存储存入数据库返回ID，然后根据
	 */
	@RequestMapping(value = "/getQrCodeURL")
	public void getQrCodeURL(HttpServletRequest request,HttpServletResponse response,String url,String kId){
		
		SharePicVO sharePicVO = new SharePicVO();
		sharePicVO.setUrl(url);
		sharePicVO.setkId(kId);
		sharePicVO.setBisClose("N");
		
		Integer id = toolsService.saveSharePic(sharePicVO);
		
		String accessToken = session.getAttribute("fw-accessToken")+"";
		if(CommonUtils.isNull(accessToken)){
			accessToken = CommonUtil.getToken(IContant.appId, IContant.appSecret).getAccessToken();
		}
		String sceneStr = id+"00";
		String ticketStr = AdvancedUtil.createPermanentQRCode(accessToken, sceneStr);
		String basePath = servletContext.getRealPath("/"); 
		String qrPath = basePath+"/resources/qrcode";
		String qrCodeUrl = AdvancedUtil.getQRCode(ticketStr,qrPath,"S-"+id);
		renderJson("{\"qrCodeUrl\":\""+ com.bavlo.weixin.qiye.util.Constants.REQURL +"/resources/qrcode/"+qrCodeUrl+"\",\"id\":\""+id+"\"}");
	}
	
	/**
	 * @Description: 转发内容页
	 * @param @param request
	 * @param @param response
	 * @param @param id
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/viewSharePic")
	public ModelAndView viewSharePic(HttpServletRequest request,HttpServletResponse response,Integer id){
		
		SharePicVO sharePicVO = toolsService.getSharePicVOById(id);
		
		ModelAndView model = new ModelAndView("mood/mood");
		model.addObject("sharePicVO",sharePicVO);
		return model;
	}
	
	/**
	 * @Description: 获取二维码是否关闭状态
	 * @param @param request
	 * @param @param response
	 * @param @param id
	 * @return void Y 关闭；N 不关闭
	 */
	@RequestMapping(value = "/getQrCodeState")
	public void getQrCodeState(HttpServletRequest request,HttpServletResponse response,Integer id){
		String basePath = servletContext.getRealPath("/");  
        String filePath = basePath +"/resources";
		SharePicVO sharePicVO = toolsService.getSharePicVOById(id);
		try {
			ReadFile.deletefile(filePath+"/S-"+id+".jpg");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		renderJson("{\"state\":\""+sharePicVO.getBisClose()+"\",\"picUrl\":\"S-"+id+".jpg\"}");
	}
	
	@Override  
    public void setServletContext(ServletContext servletContext) {  
        this.servletContext = servletContext;  
    }  
}
