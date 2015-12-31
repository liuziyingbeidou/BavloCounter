package com.bavlo.counter.web.order;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderBVO;
import com.bavlo.counter.model.order.OrderCVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.JsonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.interceptor.OAuthRequired;

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
	@Resource
	private ICustomerService customerService;

	@RequestMapping(value="/list")
	public ModelAndView orderList(String listType){
		
		//List<OrderVO> orderList = orderService.findListOrder();
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_LIST);
		model.addObject("listType", listType);
		//model.addObject("orderList", orderList);
		return model;
	}
	
	@RequestMapping(value="/listJson",method = RequestMethod.POST)
	public void orderListJson(HttpServletRequest request){
		String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " and a.vorder_code like '%"+content.trim()+"%'";
		}
		
		/**角色权限控制----开始**/
		wh = getAuthSQL(wh, "b.vservice_code","b.to_userids");
		/**角色权限控制----结束**/
		
		List<OrderVO> orderList = orderService.findListOrderBySql(wh);
		
		renderJson(orderList);
	}
	
	@RequestMapping(value="/listPicJson")
	public void orderListPicJson(HttpServletRequest request){
		String id = request.getParameter("id");
		List<CustomBVO> orderList = new ArrayList<CustomBVO>();
		if(StringUtil.isNotEmpty(id)){
			orderList = orderService.getCumPicList(Integer.valueOf(id));
		}
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
		if(listbvo != null){
			List list = JsonUtils.getList4Json(listbvo, OrderBVO.class);
			if(list != null){
				for (OrderBVO orderBVO : (List<OrderBVO>)list) {
					orderService.updateNumByCumId(id,orderBVO.getVsourceId(),orderBVO.getNnumber());
				}
			}
		}
		renderJson("{\"id\":"+id+"}");
	}
	
	@RequestMapping(value="/saveOrderCVO",method = RequestMethod.POST)
	public void saveOrderCVO(HttpServletRequest request,Integer orderId){
		System.out.println("正在保存....");
		
		String bvo = request.getParameter("bvo");
		//子表保存
		ArrayList<OrderCVO> listbvo = new ArrayList<OrderCVO>();
		JSONObject jsonBVO = JSONObject.fromObject(bvo);
		String filemodel = jsonBVO.get("filemodel") + "";
		String FILE_0 = jsonBVO.get("FILE_0") + "";
		if(StringUtil.isNotEmpty(FILE_0)){
			OrderCVO bvo_0 = new OrderCVO();
			bvo_0.setOrderId(orderId);
			bvo_0.setVname(FILE_0);
			bvo_0.setVpath(filemodel);
			bvo_0.setBiscover(IConstant.YES);
			listbvo.add(bvo_0);
		}
		String FILE_1 = jsonBVO.get("FILE_1") + "";
		if(StringUtil.isNotEmpty(FILE_1)){
			OrderCVO bvo_1 = new OrderCVO();
			bvo_1.setOrderId(orderId);
			bvo_1.setVname(FILE_1);
			bvo_1.setVpath(filemodel);
			listbvo.add(bvo_1);
		}
		String FILE_2 = jsonBVO.get("FILE_2") + "";
		if(StringUtil.isNotEmpty(FILE_2)){
			OrderCVO bvo_2 = new OrderCVO();
			bvo_2.setOrderId(orderId);
			bvo_2.setVname(FILE_2);
			bvo_2.setVpath(filemodel);
			listbvo.add(bvo_2);
		}
		String FILE_3 = jsonBVO.get("FILE_3") + "";
		if(StringUtil.isNotEmpty(FILE_3)){
			OrderCVO bvo_3 = new OrderCVO();
			bvo_3.setOrderId(orderId);
			bvo_3.setVname(FILE_3);
			bvo_3.setVpath(filemodel);
			listbvo.add(bvo_3);
		}
		String FILE_4 = jsonBVO.get("FILE_4") + "";
		if(StringUtil.isNotEmpty(FILE_4)){
			OrderCVO bvo_4 = new OrderCVO();
			bvo_4.setOrderId(orderId);
			bvo_4.setVname(FILE_4);
			bvo_4.setVpath(filemodel);
			listbvo.add(bvo_4);
		}
		String FILE_5 = jsonBVO.get("FILE_5") + "";
		if(StringUtil.isNotEmpty(FILE_5)){
			OrderCVO bvo_5 = new OrderCVO();
			bvo_5.setOrderId(orderId);
			bvo_5.setVname(FILE_5);
			bvo_5.setVpath(filemodel);
			listbvo.add(bvo_5);
		}
		String FILE_6 = jsonBVO.get("FILE_6") + "";
		if(StringUtil.isNotEmpty(FILE_6)){
			OrderCVO bvo_6 = new OrderCVO();
			bvo_6.setOrderId(orderId);
			bvo_6.setVname(FILE_6);
			bvo_6.setVpath(filemodel);
			listbvo.add(bvo_6);
		}
		String FILE_7 = jsonBVO.get("FILE_7") + "";
		if(StringUtil.isNotEmpty(FILE_7)){
			OrderCVO bvo_7 = new OrderCVO();
			bvo_7.setOrderId(orderId);
			bvo_7.setVname(FILE_7);
			bvo_7.setVpath(filemodel);
			listbvo.add(bvo_7);
		}
		String FILE_8 = jsonBVO.get("FILE_8") + "";
		if(StringUtil.isNotEmpty(FILE_8)){
			OrderCVO bvo_8 = new OrderCVO();
			bvo_8.setOrderId(orderId);
			bvo_8.setVname(FILE_8);
			bvo_8.setVpath(filemodel);
			listbvo.add(bvo_8);
		}
		
		try {
			orderService.delOrderCVOByMid(orderId);
			orderService.saveOrderCVO(listbvo);
			renderText("保存成功!");
		} catch (Exception e) {
			e.printStackTrace();
			renderText("保存失败!");
		}
	}
	
	@RequestMapping(value="/edit")
	public ModelAndView orderEdit(@RequestParam(value="id",required=true) Integer id){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_EDIT);
		OrderVO orderVO = orderService.findSigleOrder(id);
		if(orderVO != null){
			CustomerVO vo =	customerService.findCustomerById(orderVO.getCustomerId());
			if(vo != null){
				orderVO.setVdef1(vo.getVhendimgurl());
			}
			Object loginInfo = request.getSession().getAttribute("loginInfo");
			if(loginInfo == null){
				model.setViewName("common/confirm");
			}else{
				if(StringUtil.isEmpty(((LoginVO)loginInfo).getUserId())){
					model.setViewName("common/confirm");
				}else{
					List<String> roleList =((LoginVO)loginInfo).getRole();
					String roles = "[";
					if(roleList != null){
						for(int i = 0; i < roleList.size(); i++){
							roles += "'" + roleList.get(i) + "',";
						}
					}
					if(roles.length() > 2){
						roles = roles.substring(0, roles.length() - 1);
					}
					roles +="]";
					model.addObject("curRole", roles);
				}
			}
		}
		
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("ordervo",orderVO);
		return model;
	}
	
	@RequestMapping(value="/view")
	@OAuthRequired
	public ModelAndView orderView(HttpServletRequest request,@RequestParam(value="id",required=true) Integer id){
		
		OrderVO orderVO = orderService.findOrderInfoBySql(id);
		String openid = null;
		if(orderVO != null){
			CustomerVO vo =	customerService.findCustomerById(orderVO.getCustomerId());
			if(vo != null){
				orderVO.setVdef1(vo.getVhendimgurl());
				openid = vo.getVopenid();
			}
		}
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_VIEW);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_VIEW);
		model.addObject("ordervo",orderVO);
		model.addObject("openid", openid);
		Object loginInfo = request.getSession().getAttribute("loginInfo");
		if(loginInfo == null){
			model.setViewName("common/confirm");
		}else{
			if(StringUtil.isEmpty(((LoginVO)loginInfo).getUserId())){
				model.setViewName("common/confirm");
			}else{
				List<String> roleList =((LoginVO)loginInfo).getRole();
				String roles = "[";
				if(roleList != null){
					for(int i = 0; i < roleList.size(); i++){
						roles += "'" + roleList.get(i) + "',";
					}
				}
				if(roles.length() > 2){
					roles = roles.substring(0, roles.length() - 1);
				}
				roles +="]";
				model.addObject("curRole", roles);
			}
		}
		return model;
	}
	
	@RequestMapping(value="/onlyview")
	public ModelAndView orderOnlyView(HttpServletRequest request,@RequestParam(value="id",required=true) Integer id){
		
		OrderVO orderVO = orderService.findOrderInfoBySql(id);
		if(orderVO != null){
			CustomerVO vo =	customerService.findCustomerById(orderVO.getCustomerId());
			if(vo != null){
				orderVO.setVdef1(vo.getVhendimgurl());
			}
		}
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ORDER + IConstant.ORDER_VIEW);
		model.addObject("pageOrderType", IConstant.PAGE_TYPE_VIEW);
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
	
	@RequestMapping(value="/delOrderBVOById")
	public void delOrderCumById(HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtil.isEmpty(id)){
			id = "-1";
		}
		orderService.delOrderBVOById(Integer.valueOf(id));
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
