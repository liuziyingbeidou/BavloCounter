package com.bavlo.counter.service.customer.itf;

import java.util.List;

import com.bavlo.counter.model.customer.CustomerVO;


/** 
 * @Title: ����Counter
 * @ClassName: ICustomerService 
 * @Description: �ͻ��ӿ�
 * @author shijf
 * @date 2015-10-20 ����04:12:56  
 */
public interface ICustomerService {
	
	
	/** 
	 * @Description: ����ͻ�
	 * @param 
	 * @return void
	*/
	public void saveCustomer();
	
	
	/** 
	 * @Description: ɾ���ͻ�
	 * @param 
	 * @return void
	*/
	public void deleteCustomer();
	
	
	/** 
	 * @Description: ���¿ͻ�
	 * @param 
	 * @return void
	*/
	public void updateCustomer();

	
	/** 
	 * @Description: ͨ��ID���ҿͻ� 
	 * @param @return
	 * @return CustomerVO
	*/
	public CustomerVO findCustomerById();
	
	/**
	 * @Description: ͨ���������ҿͻ� 
	 * @param @return
	 * @return List<CustomerVO>
	 */
	public List<CustomerVO> findCustomerByWh();
	
	/**
	 * @Description: ���ҿͻ��б�
	 * @param @return
	 * @return List<CustomerVO>
	 */
	public List<CustomerVO> findCustomerList();

}
