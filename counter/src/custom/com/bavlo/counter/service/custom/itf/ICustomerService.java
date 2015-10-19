package com.bavlo.counter.service.custom.itf;

import com.bavlo.counter.model.custom.CustomerVO;

/**
 * @author shijf
 *
 */
public interface ICustomerService {
	
	/**
	 * ����ͻ���Ϣ
	 */
	public void saveCustomer();
	
	/**
	 * ���¿ͻ���Ϣ
	 */
	public void updateCustomer();
	
	/**
	 * ͨ��id�����û�
	 * @return
	 */
	public CustomerVO findCustomerById();

}
