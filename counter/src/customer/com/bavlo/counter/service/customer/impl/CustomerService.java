package com.bavlo.counter.service.customer.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.service.impl.CommonService;


/** 
 * @Title: ±¦ççCounter
 * @ClassName: CustomerService 
 * @Description: ¿Í»§service
 * @author shijf
 * @date 2015-10-20 ÏÂÎç04:12:30  
 */
@Service("CustomerService")
public class CustomerService extends CommonService implements ICustomerService {

	@Override
	public void saveCustomer(CustomerVO customerVO) {

	}

	@Override
	public void deleteCustomer(CustomerVO customerVO) {
		
	}

	@Override
	public void updateCustomer(CustomerVO customerVO) {
		
	}
	
	@Override
	public void saveOrUpdateCustomer(CustomerVO customerVO) {
		try {
			saveOrUpdate(customerVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CustomerVO findCustomerById() {
		return null;
	}

	@Override
	public List<CustomerVO> findCustomerByWh() {
		return null;
	}

	@Override
	public List<CustomerVO> findCustomerList() {
	
		return findAll(CustomerVO.class, "",null,"ts","desc");
	}

}
