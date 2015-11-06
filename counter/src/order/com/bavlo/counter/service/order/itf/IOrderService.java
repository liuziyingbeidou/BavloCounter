package com.bavlo.counter.service.order.itf;

import java.util.List;

import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderVO;

/**
 * @Title: ����Counter
 * @ClassName: IOrderService 
 * @Description: ����Service�ӿ�
 * @author liuzy
 * @date 2015-10-27 ����02:44:42
 */
public interface IOrderService {

	/**
	 * @Description: ���沢��������
	 * @param @return
	 * @return Integer
	 */
	public Integer saveOrderRelID(OrderVO orderVO);
	
	public void updateOrder(OrderVO orderVO);
	
	public List<OrderVO> findListOrder();
	
	public OrderVO findSigleOrder(Integer id);
	
	/*******************************�����ǽ�����ַ***********************************/
	
	public Integer saveAddrRelID(AddressVO addressVO);
	
	public void updateAddr(AddressVO addressVO);
	
	public List<AddressVO> findListAddr(String wh);
	
	public AddressVO findSigleAddr(Integer id);
	
	public void delAddrById(Integer id);
}
