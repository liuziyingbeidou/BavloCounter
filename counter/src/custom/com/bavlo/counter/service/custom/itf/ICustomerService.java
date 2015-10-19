package com.bavlo.counter.service.custom.itf;

import com.bavlo.counter.model.custom.CustomerVO;

/**
 * @author shijf
 *
 */
public interface ICustomerService {
	
	/**
	 * 保存客户信息
	 */
	public void saveCustomer();
	
	/**
	 * 更新客户信息
	 */
	public void updateCustomer();
	
	/**
	 * 通过id查找用户
	 * @return
	 */
	public CustomerVO findCustomerById();

}
