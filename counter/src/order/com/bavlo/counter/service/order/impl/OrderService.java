package com.bavlo.counter.service.order.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.order.itf.IOrderService;

/**
 * @Title: 宝珑Counter
 * @ClassName: OrderService 
 * @Description: 订单Service
 * @author liuzy
 * @date 2015-10-27 下午02:48:01
 */
@Service("orderService")
public class OrderService extends CommonService implements IOrderService {

	@Override
	public Integer saveOrderRelID(OrderVO orderVO) {
		Integer id = null;
		try {
			id = saveReID(orderVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateOrder(OrderVO orderVO) {
		update(orderVO);
	}

	@Override
	public List<OrderVO> findListOrder() {
		
		return findAll(OrderVO.class, "",null,"ts","desc");
	}

	@Override
	public OrderVO findSigleOrder(Integer id) {
		String wh = " id ="+id;
		return findFirst(OrderVO.class, wh);
	}

	/*******************************以下是交付地址***********************************/
	
	@Override
	public Integer saveAddrRelID(AddressVO addressVO) {
		Integer id = null;
		try {
			id = saveReID(addressVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateAddr(AddressVO addressVO) {
		update(addressVO);
	}

	@Override
	public List<AddressVO> findListAddr() {
		return findAll(AddressVO.class, "",null,"ts","desc");
	}

	@Override
	public AddressVO findSigleAddr(Integer id) {
		String wh = " id ="+id;
		return findFirst(AddressVO.class, wh);
	}
	
}
