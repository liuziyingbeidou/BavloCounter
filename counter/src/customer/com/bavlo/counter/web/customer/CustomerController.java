package com.bavlo.counter.web.customer;

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
 * @Title: 宝珑Counter
 * @ClassName: CustomerController
 * @Description: 客户控制器
 * @author shijf
 * @date 2015-10-20 下午04:00:41
 */
@RequestMapping("customer")
@Controller
public class CustomerController extends BaseController implements IConstant {

	@Resource
	private CustomerService customerService;

	/**
	 * @Description: 客户详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info() {

		return new ModelAndView(PATH_CUSTOMER + "customerEdit");
	}

	/**
	 * @Description: 保存或更新客户信息
	 * @param @param customerVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(CustomerVO customerVO) {

		customerService.saveOrUpdateCustomer(customerVO);
		return REDIRECT+"customer/info.do";
	}

	/**
	 * @Description: 获取客户列表
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map) {

		List<CustomerVO> customer = customerService.findCustomerList();
		map.put("customer", customer);
		return new ModelAndView(PATH_CUSTOMER + "customerList");
	}

}
