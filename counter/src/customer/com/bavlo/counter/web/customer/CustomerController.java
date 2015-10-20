package com.bavlo.counter.web.customer;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.service.customer.impl.CustomerService;

/**
 * @Title: ����Counter
 * @ClassName: CustomerController 
 * @Description: �ͻ������� 
 * @author shijf
 * @date 2015-10-20 ����04:00:41
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
