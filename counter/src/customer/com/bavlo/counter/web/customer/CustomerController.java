package com.bavlo.counter.web.customer;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.service.customer.impl.CustomerService;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomerController 
 * @Description: 客户控制器 
 * @author shijf
 * @date 2015-10-20 下午04:00:41
 */
@RequestMapping("customer")
@Controller
public class CustomerController {
	
	@Resource
	private CustomerService customerService;
	
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(){
		return "customer/customer";	
	}

}
