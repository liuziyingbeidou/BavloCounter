package com.bavlo.counter.web.customer;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.service.customer.impl.CustomerService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: CustomerController 
 * @Description: �ͻ������� 
 * @author shijf
 * @date 2015-10-20 ����04:00:41
 */
@RequestMapping("customer")
@Controller
public class CustomerController extends BaseController implements IConstant {
	
	@Resource
	private CustomerService customerService;
	
	@RequestMapping("saveOrUpdate.do")
	public String saveOrUpdate(CustomerVO customerVO){
		customerService.saveCustomer(customerVO);
		return PATH_CUSTOMER+"customer";	
	}

}
