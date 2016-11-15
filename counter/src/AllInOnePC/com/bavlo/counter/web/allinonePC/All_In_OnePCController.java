package com.bavlo.counter.web.allinonePC;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import sun.reflect.generics.tree.ReturnType;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.httpclient.HttpTools;
import com.bavlo.counter.model.manage.tools.SharePicVO;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.GenerateQrCodeUtil;
import com.bavlo.counter.utils.ReadFile;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.fuwu.util.AdvancedUtil;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;


/**
 * 
 * @Title: 宝珑Counter
 * @ClassName: All_In_OnePCController 
 * @Description: TODO 一体机拍照微信分享controller类
 * @author lisuike
 * @date 2016年10月11日 上午10:06:32
 */
@Controller("All_In_OnePCController")
@RequestMapping(value="/All_in_onePC")
public class All_In_OnePCController extends BaseController implements ServletContextAware{

	@Resource
	IToolsService toolsService;
	private ServletContext servletContext;
	
	/**
	 * 01..所要分享图片的url
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param request
	 * @param @param response
	 * @param @param url
	 * @param @param kId
	 * @return void
	 */
	@RequestMapping(value = "/getPicURL")
	public void getPicURL(HttpServletRequest request,HttpServletResponse response,String url,String id){
		if(url != null && id != null){
			SharePicVO sharePicVO = toolsService.getSharePicVOByVdef1(id);
			sharePicVO.setUrl(url);
			toolsService.updateSharePic(sharePicVO);
			renderText("SUCCESS");
		}
		//toolsService.updateQrCodeState(id);
	}
	
	/**
	 * 02..获取所拍照片
	 * @Description: 转发的内容
	 * @param @param request
	 * @param @param response
	 * @param @param id
	 * @param @return
	 * @return ModelAndView
	 * 获取代理商二维码资源
	 * http://cj.bavlo.com/web/images/agents/erweima/${agentId}.jpg
	 * 
	 * 
	 * http://192.168.1.115:8085/counter/All_in_onePC/viewSharePic.do?vdef1=1&agentId=1
	 */
	@RequestMapping(value = "/viewSharePic")
	public ModelAndView viewSharePic(HttpServletRequest request,HttpServletResponse response,String vdef1,String agentId){
		SharePicVO share = toolsService.getSharePicVOByVdef1(vdef1);
		share.setBisClose("Y");
		toolsService.updateSharePic(share);
		String agent = HttpTools.test("http://www.bavlo.com/All-in-onePC/getAgent?agentId="+agentId);
		String[] s = agent.split(",");
		String companyName = s[0];
		String tel = s[1];
		ModelAndView model = new ModelAndView("mood/mood2");
		//model.addObject("sharePicVO",sharePicVO);
		SharePicVO sharePicVO = toolsService.getSharePicVOByVdef1(vdef1);
		if(sharePicVO != null){
			model.addObject("myShowPic", sharePicVO.getUrl());
			sharePicVO.setBisClose("N");
			sharePicVO.setUrl("NULL");
			toolsService.updateSharePic(sharePicVO);
		}
		model.addObject("agentId", agentId);
		model.addObject("companyName", companyName);
		model.addObject("tel", tel);
		
		return model;
	}
	
	/**
	 * 03..获取二维码是否关闭状态
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param request
	 * @param @param response
	 * @param @param id
	 * @return void
	 */
	@RequestMapping(value = "/getQrCodeState")
	public void getQrCodeState(HttpServletRequest request,HttpServletResponse response,String id){
		SharePicVO sharePicVO = toolsService.getSharePicVOByVdef1(id);
		renderJson("{\"state\":\""+sharePicVO.getBisClose()+"\",\"picUrl\":\""+sharePicVO.getUrl()+"\"}");
	}
	
	
	
	
//----------------------------------------test---------------------------------------------
		/**
		 * 01.实现二维码
		 * @Description: TODO(在test页面获取二维码图片) 
		 * @param @param code_url
		 * @param @param response
		 * @return void
		 */
		@RequestMapping(value="getCode")
		public void getCode(String code_url,HttpServletResponse response){
			//String code_url="http://m.bavlo.com";
			GenerateQrCodeUtil.encodeQrcode(code_url, response);
			
		}
		
		/**
		 * 02.跳转test页面
		 * @Description: TODO(这里用一句话描述这个方法的作用) 
		 * @param @param request
		 * @param @param response
		 * @param @param agentId
		 * @param @param model
		 * @param @return
		 * @return String
		 */
		@RequestMapping(value="goTest")
	    public String goTest(HttpServletRequest request,HttpServletResponse response,String agentId,Model model){
	    	String code_url = "http://ct.bavlo.com/counter/All_in_onePC/viewSharePic.do?agentId="+agentId+"&id=837";
	    	model.addAttribute("code_url", code_url);
	    	model.addAttribute("agentId", agentId);
	    	return "mood/test";
	    }
	
	    /**
	     * 03.给代理商分配二维码
	     * @Description: TODO在电子柜台给代理商创建账号后，分配二维码
	     * @param @param agentId
	     * @return void
	     * 
	     * http://192.168.1.115:8085/counter/All_in_onePC/getWriteCode.do?agentId=88
	     */
		@RequestMapping(value="getWriteCode")
		public void getWriteCode(String agentId){
			SharePicVO share = toolsService.getSharePicVOByVdef1(agentId);
			Integer id = 1;
			if(share != null){
				share.setBisClose("N");
				toolsService.updateSharePic(share);
			}else{
				SharePicVO sharePicVO = new SharePicVO();
				sharePicVO.setBisClose("N");
				sharePicVO.setVdef1(agentId);
				id = toolsService.saveSharePic(sharePicVO);
			}
			
			String code_url = "http://ct.bavlo.com/counter/All_in_onePC/viewSharePic.do?agentId="+agentId+"&vdef1="+agentId+"";
			String contextPath = "agents";
			String subPath = "erweima";
			String realPath = "D:\\";
			GenerateQrCodeUtil.generateQrcode(code_url, contextPath, realPath, subPath, agentId);
			
			/*SharePicVO share = toolsService.getSharePicVOByVdef1(agentId);
			share.setUrl(code_url);
			toolsService.updateSharePic(share);*/
			renderText("二维码创建成功!!!二维码图片存储在："+realPath+"\\"+contextPath+"\\"+subPath+" 二维码图片ID为："+id);
		}
	
//----------------------------------------test---------------------------------------------
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
