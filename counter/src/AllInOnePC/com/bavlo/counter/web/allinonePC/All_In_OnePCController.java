package com.bavlo.counter.web.allinonePC;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.model.manage.tools.SharePicVO;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.ReadFile;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.fuwu.util.AdvancedUtil;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;


/**
 * 
 * @Title: ����Counter
 * @ClassName: All_In_OnePCController 
 * @Description: TODO һ�������΢�ŷ���controller��
 * @author lisuike
 * @date 2016��10��11�� ����10:06:32
 */
@Controller("All_In_OnePCController")
@RequestMapping(value="/All_in_onePC")
public class All_In_OnePCController extends BaseController implements ServletContextAware{

	@Resource
	IToolsService toolsService;
	private ServletContext servletContext;
	
	/**
	 * 01..��Ҫ����ͼƬ��url
	 * @Description: TODO(������һ�仰�����������������) 
	 * @param @param request
	 * @param @param response
	 * @param @param url
	 * @param @param kId
	 * @return void
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
	 * 02..��ȡ������Ƭ
	 * @Description: ת��������
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
	 * 03..��ȡ��ά���Ƿ�ر�״̬
	 * @Description: TODO(������һ�仰�����������������) 
	 * @param @param request
	 * @param @param response
	 * @param @param id
	 * @return void
	 */
	@RequestMapping(value = "/getQrCodeState")
	public void getQrCodeState(HttpServletRequest request,HttpServletResponse response,Integer id){
		String basePath = servletContext.getRealPath("/");  
        String filePath = basePath +"/resources/qrcode";
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
