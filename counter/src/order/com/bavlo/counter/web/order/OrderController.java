package com.bavlo.counter.web.order;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: OrderController 
 * @Description: ����Controller
 * @author liuzy
 * @date 2015-10-26 ����06:06:56
 */
@Controller("orderController")
@RequestMapping(value="/order")
public class OrderController extends BaseController {
	
	@Resource
	IOrderService orderService;

	@RequestMapping(value="/list")
	public ModelAndView orderList(){
		
		List<OrderVO> orderList = orderService.findListOrder();
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_LIST);
		model.addObject("orderList", orderList);
		return model;
	}
	
	/**
	 * @Description: �ض�����������
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/add")
	public ModelAndView orderAdd(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_EDIT);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_ADD);
		//���
		model.addObject("number", CommonUtils.getBillCode(IConstant.CODE_ORDER));
		return model;
	}
	
	@RequestMapping(value="/save")
	public void saveOrder(OrderVO orderVO){
		Integer id = orderVO.getId();
		if(id == null){
			id = orderService.saveOrderRelID(orderVO);
		}else{
			orderService.updateOrder(orderVO);
		}
		renderJson("{\"id\":"+id+"}");
	}
	
	@RequestMapping(value="/view")
	public ModelAndView orderView(@RequestParam(value="id",required=true) Integer id){
		
		OrderVO orderVO = orderService.findSigleOrder(id);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_EDIT);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("ordervo",orderVO);
		return model;
	}
	
	/*************************�����ǽ�����ַ********************************/
	@RequestMapping(value="/saveAddr",method= RequestMethod.POST)
	public void saveAddr(HttpServletRequest request,AddressVO addressVO){
		System.out.println("���ڱ����ַ��Ϣ...");
		Integer id = addressVO.getId();
		if(id == null){
			id = orderService.saveAddrRelID(addressVO);
		}else{
			orderService.updateAddr(addressVO);
		}
		StringBuilder value = new StringBuilder();
		value.append(addressVO.getVreceiverName()+" ");
		value.append(addressVO.getVprovince()+" ");
		value.append(addressVO.getVcity()+" ");
		value.append(addressVO.getVstreet());
		
		renderJson("{\"id\":\""+id+"\",\"val\":\""+value+"\"}");
	}
}
