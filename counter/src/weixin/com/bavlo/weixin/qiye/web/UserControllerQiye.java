package com.bavlo.weixin.qiye.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.weixin.qiye.interceptor.OAuthRequired;

/**
 * 需要验证OAuth2控制器
 * @author shijf
 *
 */
@Controller
public class UserControllerQiye {
	/**
	 * 加载个人信息，此处添加了@OAuthRequired注解
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"/userInfo.do"})
	@OAuthRequired
	public String load(HttpServletRequest request,Model model){
		return "user";
	}
}
