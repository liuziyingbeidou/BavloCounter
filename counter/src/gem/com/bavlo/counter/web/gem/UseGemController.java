package com.bavlo.counter.web.gem;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.service.customer.impl.CustomerService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: UseGemController
 * @Description: ��ʯ��������
 * @author shijf
 * @date 2015-10-23 ����11:49:18
 */
@RequestMapping("useGem")
@Controller
public class UseGemController extends BaseController implements IConstant {

	@Resource
	private CustomerService customerService;
	
	/**
	 * @Description: �༭��ʯ��
	 * @param @return
	 * @return String
	 */
	@RequestMapping("edit")
	public String edit() {
		return PATH_USE_GEM + "useGemEdit";
	}

	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map) {

		List<CustomerVO> customer = customerService.findCustomerList();
		map.put("customer", customer);
		return new ModelAndView(PATH_CUSTOMER + "customerList");
	}
}
