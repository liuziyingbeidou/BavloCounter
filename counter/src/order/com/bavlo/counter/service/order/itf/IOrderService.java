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
	
	public List<OrderVO> findListOrderBySql(String wh);
	
	public OrderVO findOrderInfoBySql(Integer id);
	
	/*******************************以下是交付地址***********************************/
	
	public Integer saveAddrRelID(AddressVO addressVO);
	
	public void updateAddr(AddressVO addressVO);
	
	public List<AddressVO> findListAddr(String wh);
	
	public AddressVO findSigleAddr(Integer id);
	
	public void delAddrById(Integer id);
	
	/***********************回写*********************************/
	/**
	 * 定制单保存回写订单数量、价格、图片
	 * @param orderId 订单ID
	 * @param customId 定制单ID
	 */
	public void backWriteByCum(Integer orderId,Integer customId);
	/**
	 * 回写订单状态
	 * @param orderId
	 * @param ista 提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
	 */
	public void updateOrderState(Integer orderId,Integer ista);
	/**
	 * 回写快递单号 且 回写订单状态
	 * @param orderId
	 * @param cnum
	 */
	public void updateOrderCNumber(Integer orderId,String cnum);
}
