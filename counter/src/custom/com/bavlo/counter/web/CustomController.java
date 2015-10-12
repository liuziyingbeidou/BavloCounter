package com.bavlo.counter.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("customController")
@RequestMapping(value = "/custom")
public class CustomController extends BaseController {
	
	@RequestMapping(value = "/test")
	public String test(Model model){
		model.addAttribute("name", "С��");
		model.addAttribute("string", "˵��һ�仰...");
		return "test";
	}
}
