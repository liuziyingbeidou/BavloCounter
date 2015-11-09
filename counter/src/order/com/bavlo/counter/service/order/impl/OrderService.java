package com.bavlo.counter.service.order.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.utils.StringUtil;

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
	public OrderVO saveOrderRelVO(OrderVO orderVO){
		OrderVO vo = new OrderVO();
		try {
			vo = (OrderVO)saveReDTO(orderVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	@Override
	public void updateOrder(OrderVO orderVO) {
		update(orderVO);
	}

	@Override
	public List<OrderVO> findListOrder(String wh) {
		
		return findAll(OrderVO.class, wh,null,"ts","desc");
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
			Integer custId = addressVO.getCustomerId();
			Integer count = getCountByHQL(AddressVO.class, " customerId="+custId);
			if(count == 0){
				addressVO.setBisDefault("Y");
			}
			id = saveReID(addressVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateAddr(AddressVO addressVO) {
		Integer id = addressVO.getId();
		AddressVO srcvo = findFirst(AddressVO.class, " id="+id);
		addressVO.setBisDefault(srcvo.getBisDefault());
		update(addressVO);
	}

	@Override
	public List<AddressVO> findListAddr(String wh) {
		return findAll(AddressVO.class, wh,null,"ts","desc");
	}

	@Override
	public AddressVO findSigleAddr(Integer id) {
		String wh = " id ="+id;
		return findFirst(AddressVO.class, wh);
	}

	@Override
	public void delAddrById(Integer id) {
		delete(AddressVO.class, id);
	}
	
}
