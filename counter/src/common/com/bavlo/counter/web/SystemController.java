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
public class SystemController extends BaseController {
	
	@RequestMapping(value={"/index.do"})
	@OAuthRequired
	public ModelAndView index(HttpServletRequest request,HttpSession session){
		
		ModelAndView model = new ModelAndView("index");
		Object loginInfo = session.getAttribute("loginInfo");
		if(loginInfo != null){
			LoginVO loginVO = (LoginVO)loginInfo;
			model.addObject("uvo", loginVO);
		}else{
			model.setViewName("redirect:/index.do");
		}
		System.out.println("µÇÂ¼ÈËÐÅÏ¢:"+JsonUtils.getJsonString4JavaPOJO(loginInfo));
		return model;
	}
}
