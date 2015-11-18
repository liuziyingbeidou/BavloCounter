package com.bavlo.counter.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="systemController")
@RequestMapping(value="/sys")
public class SystemController extends BaseController {

	@RequestMapping(value="index")
	public ModelAndView index(){
	
		ModelAndView model = new ModelAndView("index");
		
		return model;
	}
}
