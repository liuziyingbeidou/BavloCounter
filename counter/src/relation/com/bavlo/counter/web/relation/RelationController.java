package com.bavlo.counter.web.relation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/** 
 * @Title: ����Counter
 * @ClassName: ��ʷ��¼
 * @Description: TODO(������һ�仰��������������) 
 * @author shijf
 * @date 2016��1��20�� ����3:42:40  
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
