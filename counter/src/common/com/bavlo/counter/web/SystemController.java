package com.bavlo.counter.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.utils.JsonUtils;
import com.bavlo.weixin.qiye.interceptor.OAuthRequired;

@Controller(value="systemController")
@RequestMapping(value="/sys")
public class SystemController extends BaseController {

	@RequestMapping(value={"/index.do"})
	//@OAuthRequired
	public ModelAndView index(HttpServletRequest request){
		ModelAndView model = new ModelAndView("index");
		HttpSession session = request.getSession();
		Object loginInfo = session.getAttribute("loginInfo");
		if(loginInfo != null){
			LoginVO loginVO = (LoginVO)loginInfo;
			System.out.println(JsonUtils.getJsonString4JavaPOJO(loginVO));
		}
		return model;
	}
}
