package com.bavlo.counter.service.order.itf;

import java.util.List;

import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderBVO;
import com.bavlo.counter.model.order.OrderVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: IOrderService 
 * @Description: 订单Service接口
 * @author liuzy
 * @date 2015-10-27 下午02:44:42
 */
public interface IOrderService {

	/**
	 * @Description: 保存并返回主键
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
	
	/*******************************以下是交付地址***********************************/
	
	public Integer saveAddrRelID(AddressVO addressVO);
	
	public void updateAddr(AddressVO addressVO);
	
	public List<AddressVO> findListAddr(String wh);
	
	public AddressVO findSigleAddr(Integer id);
	
	public void delAddrById(Integer id);
}
