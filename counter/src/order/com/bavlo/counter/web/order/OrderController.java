package com.bavlo.counter.web.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: OrderController 
 * @Description: ����Controller
 * @author liuzy
 * @date 2015-10-26 ����06:06:56
 */
@Controller("orderController")
@RequestMapping(value="/order")
public class OrderController extends BaseController {

	/**
	 * @Description: �ض�����������
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/add")
	public ModelAndView orderAdd(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_EDIT);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_ADD);
		return model;
	}
}
