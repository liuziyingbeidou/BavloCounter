package com.bavlo.counter.web.relation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/** 
 * @Title: 宝珑Counter
 * @ClassName: 历史记录
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author shijf
 * @date 2016年1月20日 下午3:42:40  
 */
@Controller
@RequestMapping("relation")
public class RelationController {
	
	@RequestMapping("getList")
	public ModelAndView getList(String listType){
		ModelAndView mode = new ModelAndView();
		return mode;
	}

}
