package com.bavlo.counter.web.remote;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bavlo.counter.utils.JsonUtils;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.interceptor.OAuthRequired;

@Controller("remoteController")
@RequestMapping(value = "/remote")
public class RemoteController extends BaseController {

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
}
