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
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderBVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.JsonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: 宝珑Counter
 * @ClassName: OrderController 
 * @Description: 订单Controller
 * @author liuzy
 * @date 2015-10-26 下午06:06:56
 */
@Controller("orderController")
@RequestMapping(value="/order")
public class OrderController extends BaseController {
	
	@Resource
	IOrderService orderService;
	@Resource
	ICustomService customService;

	@RequestMapping(value="/list")
	public ModelAndView orderList(){
		
		//List<OrderVO> orderList = orderService.findListOrder();
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_LIST);
		//model.addObject("orderList", orderList);
		return model;
	}
	
	@RequestMapping(value="/listJson",method = RequestMethod.POST)
	public void orderListJson(HttpServletRequest request){
		String content = request.getParameter("content");
		/*String wh = " 1=1";
		if(StringUtil.isNotEmpty(content)){
			wh = " vorderCode like '%"+content+"%'";
		}*/
		List<OrderVO> orderList = orderService.findListOrderBySql(content);
		
		renderJson(orderList);
	}
	
	/**
	 * @Description: 重定向到新增界面
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/add")
	public ModelAndView orderAdd(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_EDIT);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_ADD);
		//编号
		model.addObject("number", CommonUtils.getBillCode(IConstant.CODE_ORDER));
	
		return model;
	}
	
	@RequestMapping(value="/save")
	public void saveOrder(HttpServletRequest request,OrderVO orderVO){
		Integer id = orderVO.getId();
		String listbvo = request.getParameter("list");
		
		if(id == null){
			id = orderService.saveOrderRelID(orderVO);
		}else{
			orderService.updateOrder(orderVO);
		}
		
		//组织子表数据-删除更新
		List list = JsonUtils.getList4Json(listbvo, OrderBVO.class);
		if(list != null){
			orderService.delOrderByMid(id);
			orderService.saveOrderBVO(id,list);
		}
		
		renderJson("{\"id\":"+id+"}");
	}
	
	@RequestMapping(value="/edit")
	public ModelAndView orderEdit(@RequestParam(value="id",required=true) Integer id){
		
		OrderVO orderVO = orderService.findSigleOrder(id);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_EDIT);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("ordervo",orderVO);
		return model;
	}
	
	@RequestMapping(value="/view")
	public ModelAndView orderView(@RequestParam(value="id",required=true) Integer id){
		
		OrderVO orderVO = orderService.findOrderInfoBySql(id);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_VIEW);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("ordervo",orderVO);
		return model;
	}
	
	@RequestMapping(value="/getCumById")
	public void getCumById(Integer id){
		CustomVO cvo = customService.findCustomById(id);
		renderJson(cvo);
	}
	
	@RequestMapping(value="/getOrderListByMid")
	public void getOrderListByMid(Integer mid){
		List<OrderBVO> listvo = orderService.findListOrderBVO(mid);
		renderJson(listvo);
	}
	
	/*************************以下是交付地址********************************/
	@RequestMapping(value="/saveAddr",method= RequestMethod.POST)
	public void saveAddr(HttpServletRequest request,AddressVO addressVO){
		System.out.println("正在保存地址信息...");
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
		value.append(addressVO.getVdistrict()+" ");
		value.append(addressVO.getVstreet());
		
		renderJson("{\"id\":\""+id+"\",\"val\":\""+value+"\"}");
	}
	
	@RequestMapping(value="/getAddrListJson")
	public void getAddrListJson(HttpServletRequest request){
		String customerId = request.getParameter("customerId");
		String wh = " 1=2";
		if(StringUtil.isNotEmpty(customerId+"")){
			wh = " customerId="+customerId;
		}
		List<AddressVO> list = orderService.findListAddr(wh);
		renderJson(list);
	}
	
	@RequestMapping(value="/getAddrInfoJsonById")
	public void getAddrInfoJsonById(HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtil.isEmpty(id)){
			id = "-1";
		}
		AddressVO vo = orderService.findSigleAddr(Integer.valueOf(id));
		renderJson(vo);
	}
	
	@RequestMapping(value="/delAddrById")
	public void delAddrById(HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtil.isEmpty(id)){
			id = "-1";
		}
		orderService.delAddrById(Integer.valueOf(id));
	}
	
	@RequestMapping(value="/updateState")
	public void updateState(Integer orderId,Integer ista){
		try {
			orderService.updateOrderState(orderId,ista);
			renderText("保存成功!");
		} catch (Exception e) {
			renderText("保存失败!");
		}
	}
	@RequestMapping(value="/updateOrderCNumber")
	public void updateOrderCNumber(Integer orderId,String cnum){
		try {
			orderService.updateOrderCNumber(orderId, cnum);
			renderText("保存成功!");
		} catch (Exception e) {
			renderText("保存失败!");
		}
	}
}
