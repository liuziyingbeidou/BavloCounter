package com.bavlo.counter.service.customer.itf;

import java.util.List;

import com.bavlo.counter.model.customer.CustomerVO;

/**
 * @ClassName: ICustomerService
 * @Description: 客户接口
 * @author shijf
 * @date 2015-10-20 上午11:20:28
 *
 */
public interface ICustomerService {
	
	/**
	 * @Title: saveCustomer
	 * @Description: 保存客户
	 * @param 
	 * @return void
	 * @throws
	 */
	public void saveCustomer();
	
	/**
	 * @Title: deleteCustomer
	 * @Description: 删除客户
	 * @param 
	 * @return void
	 * @throws
	 */
	public void deleteCustomer();
	
	/**
	 * @Title: updateCustomer
	 * @Description: 更新客户
	 * @param 
	 * @return void
	 * @throws
	 */
	public void updateCustomer();

	/**
	 * @Title: findCustomerById
	 * @Description: 通过ID查找客户
	 * @param @return
	 * @return CustomerVO
	 * @throws
	 */
	public CustomerVO findCustomerById();
	
	/**
	 * @Title: findCustomerByWh
	 * @Description: 通过条件查找客户
	 * @param @return
	 * @return List<CustomerVO>
	 * @throws
	 */
	public List<CustomerVO> findCustomerByWh();
	
	/**
	 * @Title: findCustomerList
	 * @Description: 查找客户列表
	 * @param @return
	 * @return List<CustomerVO>
	 * @throws
	 */
	public List<CustomerVO> findCustomerList();

}
