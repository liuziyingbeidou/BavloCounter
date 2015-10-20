package com.bavlo.counter.service.customer.itf;

import java.util.List;

import com.bavlo.counter.model.customer.CustomerVO;

/**
 * @ClassName: ICustomerService
 * @Description: �ͻ��ӿ�
 * @author shijf
 * @date 2015-10-20 ����11:20:28
 *
 */
public interface ICustomerService {
	
	/**
	 * @Title: saveCustomer
	 * @Description: ����ͻ�
	 * @param 
	 * @return void
	 * @throws
	 */
	public void saveCustomer();
	
	/**
	 * @Title: deleteCustomer
	 * @Description: ɾ���ͻ�
	 * @param 
	 * @return void
	 * @throws
	 */
	public void deleteCustomer();
	
	/**
	 * @Title: updateCustomer
	 * @Description: ���¿ͻ�
	 * @param 
	 * @return void
	 * @throws
	 */
	public void updateCustomer();

	/**
	 * @Title: findCustomerById
	 * @Description: ͨ��ID���ҿͻ�
	 * @param @return
	 * @return CustomerVO
	 * @throws
	 */
	public CustomerVO findCustomerById();
	
	/**
	 * @Title: findCustomerByWh
	 * @Description: ͨ���������ҿͻ�
	 * @param @return
	 * @return List<CustomerVO>
	 * @throws
	 */
	public List<CustomerVO> findCustomerByWh();
	
	/**
	 * @Title: findCustomerList
	 * @Description: ���ҿͻ��б�
	 * @param @return
	 * @return List<CustomerVO>
	 * @throws
	 */
	public List<CustomerVO> findCustomerList();

}
