package com.bavlo.counter.service.customer.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.customer.CustomerVO;
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
	public void saveCustomer(CustomerVO custoerVO) {
		try {
			save(custoerVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCustomer() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCustomer() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CustomerVO findCustomerById() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomerVO> findCustomerByWh() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomerVO> findCustomerList() {
		// TODO Auto-generated method stub
		return null;
	}

}
