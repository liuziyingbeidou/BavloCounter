package com.bavlo.weixin.fuwu.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.model.manage.tools.SharePicVO;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.weixin.fuwu.message.req.ImageMessage;
import com.bavlo.weixin.fuwu.message.resp.Article;
import com.bavlo.weixin.fuwu.message.resp.ForwardMessage;
import com.bavlo.weixin.fuwu.message.resp.KfAccountInfo;
import com.bavlo.weixin.fuwu.message.resp.NewsMessage;
import com.bavlo.weixin.fuwu.service.itf.ICoreService;
import com.bavlo.weixin.fuwu.util.IContant;
import com.bavlo.weixin.fuwu.util.MessageUtil;
import com.bavlo.weixin.qiye.util.WechatDepart;

/**
 * 核心服务类
 * 
 * @author shijf
 */
@Service("fwcoreService")
public class CoreService extends CommonService implements ICoreService{
	
	@Resource
	ICustomerService customerService;
	@Resource
	IToolsService toolsService;
	/**
	 * 处理微信发来的请求，转发到指定客服
	 * 
	 * @param request
	 * @return xml
	 */
	@Override
	public String processRequest(HttpServletRequest request,HttpSession session) {
		// xml格式的消息数据
		String respXml = null;
		try {
			// 调用parseXml方法解析请求消息
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// 发送方帐号
			String fromUserName = requestMap.get("FromUserName");
			// 开发者微信号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			// 消息内容
			String content = requestMap.get("Content");
			
			ForwardMessage forwardMessage = new ForwardMessage();
			forwardMessage.setToUserName(fromUserName);
			forwardMessage.setFromUserName(toUserName);
			forwardMessage.setCreateTime(new Date().getTime());
			forwardMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			// 事件推送
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅{用户未关注时，进行关注后的事件推送}
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					String eventKey = requestMap.get("EventKey");
					if(eventKey != null && eventKey != ""){
						/**扫描二维码-分享图片-start**/
						String dStr = null;
						if(eventKey.length() > 2){
							dStr = eventKey.substring(eventKey.length()-2,eventKey.length());
						}
						//分享图片
						if("00".equals(dStr)){
							//获取图片URL对应ID
							String id = eventKey.substring(0, eventKey.length()-2);
							//根据id获取picUrl
							if(id != null && id != ""){
								SharePicVO sharePicVO = toolsService.getSharePicVOById(Integer.valueOf(id));
								NewsMessage newsMessage = new NewsMessage();
								newsMessage.setToUserName(fromUserName);
								newsMessage.setFromUserName(toUserName);
								newsMessage.setCreateTime(new Date().getTime());
								newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
								newsMessage.setArticleCount(1);
								List<Article> articlesList = new ArrayList<Article>();
								Article article = new Article();
								article.setPicUrl(sharePicVO.getUrl());
								article.setTitle("哈哈！我在宝珑珠宝体验了虚拟试戴...");//IContant.mTitle
								article.setDescription("看看我选的款式！也可分享给好友哦！");//IContant.mContent
								article.setUrl(com.bavlo.weixin.qiye.util.Constants.REQURL +"/remote/viewSharePic.do?id="+Integer.valueOf(id));
								articlesList.add(article);
								newsMessage.setArticles(articlesList);
								
								respXml = MessageUtil.messageToXml(newsMessage);
							}
							/**扫描二维码-分享图片-end**/
						}else{
							/**扫描二维码信息--本地库不存在该openId用户---开始**/
							
							String vcode = customerService.addCustomerByScan(fromUserName, session, eventKey);
							/**扫描二维码信息---结束**/
							// 以下通过客服找绑定客服定制顾问名字
							CustomerVO customerVO = customerService.findCustomerByWhere(" vcustomerCode='"+vcode+"'");
							if(vcode != null){
								if(customerVO != null){
									eventKey = customerVO.getVserviceCode();
								}
							}
							String userId = customerService.getQYUserIdByKfCode(eventKey);
							JSONObject  obj = WechatDepart.getUserInfo(request,userId);
							String uname = obj.getString("name");

							customerVO.setToUserids(userId);
							customerService.updateCustomer(customerVO);
							/**扫描二维码信息---结束**/
							//forwardMessage.setContent("这是您的编号:"+vcode);
							forwardMessage.setContent("感谢关注！\n我是宝珑珠宝定制顾问---"+uname+"，您有任何需求可在此与我沟通。随时为您服务 :)");
							// 将消息对象转换成xml
							respXml = MessageUtil.messageToXml(forwardMessage);
						}
					}
				}
				// 转接客服会话
				else if (eventType.equals(MessageUtil.EVENT_TYPE_SWITCH_SESSION)) {
					/*forwardMessage.setMsgType(msgType);
					forwardMessage.setEvent(eventType);
					forwardMessage.setFromKfAccount(fromUserName);
					forwardMessage.setToKfAccount(fromUserName);
					respXml = MessageUtil.messageToXml(forwardMessage);
					System.out.println(respXml);*/
				}
				// 关闭客服会话
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLOSE_SESSION)) {
					
					forwardMessage.setContent("客服已经下线！");
					// 将消息对象转换成xml
					respXml = MessageUtil.messageToXml(forwardMessage);
				}
				//用户已关注时的事件推送
				else if(eventType.equals(MessageUtil.EVENT_TYPE_SCAN)){
					String eventKey = requestMap.get("EventKey");
					if(eventKey != null && eventKey != ""){
						/**扫描二维码-分享图片-start**/
						System.out.println("eventKey:"+eventKey);
						String dStr = null;
						if(eventKey.length() > 2){
							dStr = eventKey.substring(eventKey.length()-2,eventKey.length());
						}
						//分享图片
						if("00".equals(dStr)){
							//获取图片URL对应ID
							String id = eventKey.substring(0, eventKey.length()-2);
							//根据id获取picUrl
							if(id != null && id != ""){
								SharePicVO sharePicVO = toolsService.getSharePicVOById(Integer.valueOf(id));
								NewsMessage newsMessage = new NewsMessage();
								newsMessage.setToUserName(fromUserName);
								newsMessage.setFromUserName(toUserName);
								newsMessage.setCreateTime(new Date().getTime());
								newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
								newsMessage.setArticleCount(1);
								List<Article> articlesList = new ArrayList<Article>();
								Article article = new Article();
								article.setPicUrl(sharePicVO.getUrl());
								article.setTitle("哈哈！我在宝珑珠宝体验了虚拟试戴...");//IContant.mTitle
								article.setDescription("看看我选的款式！也可分享给好友哦！");//IContant.mContent
								article.setUrl(com.bavlo.weixin.qiye.util.Constants.REQURL +"/remote/viewSharePic.do?id="+Integer.valueOf(id));
								articlesList.add(article);
								newsMessage.setArticles(articlesList);
								
								respXml = MessageUtil.messageToXml(newsMessage);
							}
							/**扫描二维码-分享图片-end**/
						}else{
							/**扫描二维码信息--本地库不存在该openId用户---开始**/
							String vcode = customerService.addCustomerByScan(fromUserName, session, eventKey);
							// 以下通过客服找绑定客服定制顾问名字
							CustomerVO customerVO = customerService.findCustomerByWhere(" vcustomerCode='"+vcode+"'");
							if(vcode != null){
								if(customerVO != null){
									if(customerVO.getVserviceCode() != null && customerVO.getVserviceCode() != ""){
										eventKey = customerVO.getVserviceCode();
									}
								}
							}
							String userId = customerService.getQYUserIdByKfCode(eventKey);
							JSONObject  obj = WechatDepart.getUserInfo(request,userId);
							String uname = obj.getString("name");
							
							customerVO.setToUserids(userId);
							customerService.updateCustomer(customerVO);
							/**扫描二维码信息---结束**/
							//forwardMessage.setContent("这是您的编号:"+vcode);
							forwardMessage.setContent("感谢关注！\n我是宝珑珠宝定制顾问---"+uname+"，您有任何需求可在此与我沟通。随时为您服务 :)");
							// 将消息对象转换成xml
							respXml = MessageUtil.messageToXml(forwardMessage);
						}
					}
				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 暂不做处理
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// 事件KEY值，与创建菜单时的key值对应
					String eventKey = requestMap.get("EventKey");
					// TODO 暂不做处理
					// 根据key值判断用户点击的按钮
					/*if (eventKey.equals("oschina")) {
						Article article = new Article();
						article.setTitle("开源中国");
						article.setDescription("开源中国社区成立于2008年8月，是目前中国最大的开源技术社区。\n\n开源中国的目的是为中国的IT技术人员提供一个全面的、快捷更新的用来检索开源软件以及交流开源经验的平台。\n\n经过不断的改进,目前开源中国社区已经形成了由开源软件库、代码分享、资讯、讨论区和博客等几大频道内容。");
						article.setPicUrl("");
						article.setUrl("http://m.oschina.net");
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// 创建图文消息
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respXml = MessageUtil.messageToXml(newsMessage);
					} else if (eventKey.equals("iteye")) {
						forwardMessage.setContent("ITeye即创办于2003年9月的JavaEye,从最初的以讨论Java技术为主的技术论坛，已经逐渐发展成为涵盖整个软件开发领域的综合性网站。\n\nhttp://www.iteye.com");
						respXml = MessageUtil.messageToXml(forwardMessage);
					}*/
				}
			}
			// 当用户发消息时
			else {
				CustomerVO service = customerService.findCustomerByWhere(" vopenid = '"+fromUserName+"'");
				String serviceCode = IContant.serviceCode;
				if(service != null){
					String temCode = service.getVserviceCode();
					if(StringUtil.isNotEmpty(temCode)){
						serviceCode = temCode;
					}
				}
				serviceCode += "@bavlo001";
				KfAccountInfo kfAccount = new KfAccountInfo();
				kfAccount.setKfAccount(serviceCode);
				forwardMessage.setMsgType("transfer_customer_service");
				forwardMessage.setTransInfo(kfAccount);
				respXml = MessageUtil.messageToXml(forwardMessage);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respXml;
	}

}
