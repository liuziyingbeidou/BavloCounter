package com.bavlo.counter.service.customer.itf;

import java.util.List;

import com.bavlo.counter.model.customer.CustomerVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: ICustomerService
 * @Description: 客户接口
 * @author shijf
 * @date 2015-10-20 下午04:12:56
 */
public interface ICustomerService {

	/**
	 * @Description: 保存客户
	 * @param
	 * @return void
	 */
	public void saveCustomer(CustomerVO customerVO);

	/**
	 * @Description: 删除客户
	 * @param
	 * @return void
	 */
	public void deleteCustomer(CustomerVO customerVO);

	/**
	 * @Description: 更新客户
	 * @param
	 * @return void
	 */
	public void updateCustomer(CustomerVO customerVO);
	
	/**
	 * @Description: 更新客户
	 * @param
	 * @return void
	 */
	public void saveOrUpdateCustomer(CustomerVO customerVO);

	/**
	 * @Description: 通过ID查找客户
	 * @param @return
	 * @return CustomerVO
	 */
	public CustomerVO findCustomerById(Integer id);

	/**
	 * @Description: 通过条件查找客户
	 * @param @return
	 * @return List<CustomerVO>
	 */
	public List<CustomerVO> findCustomerByWh();

	/**
	 * @Description: 查找客户列表
	 * @param @return
	 * @return List<CustomerVO>
	 */
	public List<CustomerVO> findCustomerList(String wh);

}
