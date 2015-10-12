package com.bavlo.weixin.fuwu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bavlo.weixin.fuwu.message.resp.Article;
import com.bavlo.weixin.fuwu.message.resp.ForwardMessage;
import com.bavlo.weixin.fuwu.message.resp.NewsMessage;
import com.bavlo.weixin.fuwu.util.MessageUtil;

/**
 * 核心服务类
 * 
 * @author shijf
 */
public class CoreService {
	/**
	 * 处理微信发来的请求，转发到指定客服
	 * 
	 * @param request
	 * @return xml
	 */
	public static String processRequest(HttpServletRequest request) {
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

			ForwardMessage forwardMessage = new ForwardMessage();
			forwardMessage.setToUserName(fromUserName);
			forwardMessage.setFromUserName(toUserName);
			forwardMessage.setCreateTime(new Date().getTime());
			forwardMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			// 事件推送
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					forwardMessage.setContent("您好，欢迎关注网址导航！我们致力于打造精品网址聚合应用，为用户提供便捷的上网导航服务。体验生活，从这里开始！");
					// 将消息对象转换成xml
					respXml = MessageUtil.messageToXml(forwardMessage);
				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 暂不做处理
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// 事件KEY值，与创建菜单时的key值对应
					String eventKey = requestMap.get("EventKey");
					// 根据key值判断用户点击的按钮
					if (eventKey.equals("oschina")) {
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
					}
				}
			}
			// 当用户发消息时
			else {
				forwardMessage.setContent("=================");
				forwardMessage.setKfAccount("ceshi@bavlo001");
				forwardMessage.setMsgType("transfer_customer_service");
				respXml = MessageUtil.messageToXml(forwardMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respXml;
	}
}
