package com.bavlo.counter.web.remote;

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
	public void getQrCodeURL(HttpServletRequest request,HttpServletResponse response,String url){
		
		SharePicVO sharePicVO = new SharePicVO();
		sharePicVO.setUrl(url);
		
		String str = "001.jpg";
		System.out.println("ddd:"+str.substring(2, str.length()));
		
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
		renderJson("{\"qrCodeUrl\":\""+ com.bavlo.weixin.qiye.util.Constants.REQURL +"/resources/qrcode/"+qrCodeUrl+"\"}");
	}
	
	@RequestMapping(value = "/viewSharePic")
	public ModelAndView viewSharePic(HttpServletRequest request,HttpServletResponse response,Integer id){
		
		SharePicVO sharePicVO = toolsService.getSharePicVOById(id);
		
		ModelAndView model = new ModelAndView("mood/mood");
		model.addObject("sharePicVO",sharePicVO);
		return model;
	}
	
	@Override  
    public void setServletContext(ServletContext servletContext) {  
        this.servletContext = servletContext;  
    }  
}
