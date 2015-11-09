package com.bavlo.counter.service.order.itf;

import java.util.List;

import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderBVO;
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
	
	public OrderVO saveOrderRelVO(OrderVO orderVO);
	
	public void saveOrderBVO(Integer id,List<OrderBVO> orderListBVO);
	
	public void updateOrder(OrderVO orderVO);
	
	public List<OrderVO> findListOrder(String wh);
	
	public OrderVO findSigleOrder(Integer id);
	
	public void delOrderById(Integer id);
	
	public void delOrderByMid(Integer mid);
	
	public List<OrderBVO> findListOrderBVO(Integer mid);
	
	/*******************************�����ǽ�����ַ***********************************/
	
	public Integer saveAddrRelID(AddressVO addressVO);
	
	public void updateAddr(AddressVO addressVO);
	
	public List<AddressVO> findListAddr(String wh);
	
	public AddressVO findSigleAddr(Integer id);
	
	public void delAddrById(Integer id);
}
