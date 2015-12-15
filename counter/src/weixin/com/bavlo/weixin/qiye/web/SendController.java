package com.bavlo.weixin.qiye.web;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.utils.DateUtil;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.util.Constants;
import com.bavlo.weixin.qiye.util.WechatSendMessage;

/**
 * @author shiJf 发送消息控制类
 *
 */
@Controller
public class SendController extends BaseController{

	/**
	 * @Description: 转发页面 
	 * @param @param request
	 * @param @param touser
	 * @param @param toparty
	 * @param @param totag
	 * @param @param agentid
	 * @param @param text 
	 * @param @param memo 
	 * @param @param pageType
	 * @param @param rootPath 
	 * @param @param id 
	 * @return void
	 */
	@RequestMapping("/sendMassage.do")
	public void sendMassage(HttpServletRequest request,String touser, String toparty, String totag,
			String agentid, String text,String memo,String pageAttr,String rootPath,Integer id) {
		boolean isTurn = true;
		String url = "http://lzy348860554.imwork.net/counter/index.do";
		String actionName = "";
		String actionPsn = "SYSTEM";
		Object info = request.getSession().getAttribute("loginInfo");
		if(info != null){
			LoginVO loginVO = (LoginVO)info;
			actionPsn = loginVO.getUserId();
		}
		//客户(cust)
		if(IConstant.PAGE_ATTR_CUST.equals(pageAttr)){
			text = "客户资料-" + actionPsn + "(" + DateUtil.getCurDateTime()+")";
			actionName = "customer/info.do?id="+id;
		}else
		//定制单(style)
		if(IConstant.PAGE_ATTR_STYLE.equals(pageAttr)){
			text = "定制单-" + actionPsn + "(" + DateUtil.getCurDateTime()+")";
			actionName = "custom/detail.do?id="+id;
		}else
		//订单(order)
		if(IConstant.PAGE_ATTR_ORDER.equals(pageAttr)){
			text = "订单-" + actionPsn + "(" + DateUtil.getCurDateTime()+")";
			actionName = "order/view.do?id="+id;
		}else
		//宝石签收单(gem)
		if(IConstant.PAGE_ATTR_GEM.equals(pageAttr)){
			text = "宝石签收单-" + actionPsn + "(" + DateUtil.getCurDateTime()+")";
			actionName = "gem-sign/view.do?id="+id;
		}else
		//实物签收单(entity)
		if(IConstant.PAGE_ATTR_ENTITY.equals(pageAttr)){
			text = "实物签收单-" + actionPsn + "(" + DateUtil.getCurDateTime()+")";
			actionName = "entity-sign/view.do.id="+id;
		}else
		//配石单(deploy)
		if(IConstant.PAGE_ATTR_DEPLOY.equals(pageAttr)){
			text = "配石单-" + actionPsn + "(" + DateUtil.getCurDateTime()+")";
		}else{
			isTurn = false;
		}
		url = rootPath + "/" + actionName;
		Integer result = -1;
		if(isTurn){
			result = WechatSendMessage.sendMassage(request,touser, "@all", "@all", Constants.AGENTID+"", text,memo,url);
		}
		renderText(result+"");
	}

}
