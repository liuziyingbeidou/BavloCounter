package com.bavlo.weixin.fuwu.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bavlo.weixin.fuwu.service.itf.ICoreService;
import com.bavlo.weixin.fuwu.util.SignUtil;

/**
 * 请求处理的核心类
 * 
 * @author shijf
 */
@Controller("fwcoreController")
public class CoreControllerFuwu {
	
	@Resource
	ICoreService fwcoreService;

	/**
	 * 请求校验（确认请求来自微信服务器）
	 */
	@RequestMapping(value = { "/serveCoreJoin.do" }, method = RequestMethod.GET)
	public void coreJoinGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 微信加密签名
		String signature = request.getParameter("signature");
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		// 随机数
		String nonce = request.getParameter("nonce");
		// 随机字符串
		String echostr = request.getParameter("echostr");

		PrintWriter out = response.getWriter();
		// 请求校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			out.print(echostr);
		}
		out.close();
		out = null;
	}

	/**
	 * 处理微信服务器发来的消息
	 */
	@RequestMapping(value = { "/serveCoreJoin.do" }, method = RequestMethod.POST)
	public void coreJoinPost(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws IOException {
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 调用核心业务类接收消息、处理消息
		String respXml = fwcoreService.processRequest(request,session);

		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(respXml);
		out.close();
	}
}
