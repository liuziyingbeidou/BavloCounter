package com.bavlo.counter.web.custom;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomCVO;
import com.bavlo.counter.model.custom.CustomDVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.model.order.OrderBVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.service.sign.itf.IGemSignService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.interceptor.OAuthRequired;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomController
 * @Description: 控制器
 * @author shijf
 * @date 2015-10-20 下午04:00:41
 */
@RequestMapping("custom")
@Controller
public class CustomController extends BaseController implements IConstant {

	@Resource
	private ICustomerService customerService;
	@Resource
	private ICustomService customService;
	@Resource
	private IGemSignService gemSignService;
	@Resource
	private IOrderService orderService;

	/**
	 * @Description: 款式单编辑
	 * @param @return
	 * @return ModelAndView
	 * orderId=1&customerId=1
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Integer id, Integer orderId, Integer customerId) {

		CustomVO customEdit = customService.findCustomById(id);
		
		List<CustomCVO> customCVO = customService.findListCustomC(id);
		List<CustomDVO> customDVO = customService.findListCustomD(id);
		
		JSONArray chainJson = JSONArray.fromObject(customCVO);
		JSONArray stockGemJson = JSONArray.fromObject(customDVO);
		
		LoginVO loginInfo = (LoginVO) session.getAttribute("loginInfo");
		String weChat = null;
		if(loginInfo != null){
			weChat = loginInfo.getMuserId();
		}
		
		ModelAndView model = new ModelAndView(PATH_CUSTOM + "customEdit");
		if(customEdit == null){
			customEdit = new CustomVO();
			model.addObject("pageCustomType", IConstant.PAGE_TYPE_ADD);
		}
		if(orderId != null){
			customEdit.setOrderId(orderId);
		}
		if(customerId != null){
			customEdit.setCustomerId(customerId);
		}
		model.addObject("pageCustomType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("customEdit", customEdit);
		model.addObject("chainJson", chainJson);
		model.addObject("stockGemJson", stockGemJson);
		model.addObject("weChat", weChat);
		model.addObject("number", CommonUtils.getBillCode("CM"));
		return model;
	}
	
	/**
	 * @Description: 客户所属
	 * @param @param session
	 * @param @param id
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("customByCmr")
	public ModelAndView customerToCum(HttpSession session,Integer id){
		ModelAndView model = new ModelAndView(PATH_CUSTOM + "customDetail");
		
		if(id != null){
			CustomVO customDetail = customService.findCustomById(id);
			CustomerVO customer = null;
			String openid = null;
			OrderVO orderVO = null;
			if(customDetail != null){
				Integer orderId = customDetail.getOrderId();
				if(orderId != null){
					orderVO = orderService.findSigleOrder(customDetail.getOrderId());
				}
				customer = customerService.findCustomerById(customDetail.getCustomerId());
			}
			if(customer != null){
				openid = customer.getVopenid();
			}
			
			LoginVO loginInfo = (LoginVO) session.getAttribute("loginInfo");
			String shop = null;
			if(loginInfo != null){
				shop = loginInfo.getShop();
			}
			
			List<CustomCVO> customCVO = customService.findListCustomC(id);
			List<CustomDVO> customDVO = customService.findListCustomD(id);
			
			JSONArray chainJson = JSONArray.fromObject(customCVO);
			JSONArray stockGemJson = JSONArray.fromObject(customDVO);
			
			model.addObject("customDetail", customDetail);
			model.addObject("shop", shop);
			model.addObject("orderVO", orderVO);
			model.addObject("openid", openid);
			model.addObject("chainJson", chainJson);
			model.addObject("stockGemJson", stockGemJson);
			
			//liuzy add by 20151229  订单进入生产后不可编辑
			
		}
		
		return model;
	}
	
	/**
	 * @Description: 款式单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("detail")
	@OAuthRequired
	public ModelAndView detail(HttpSession session,Integer id) {
		
		ModelAndView model = new ModelAndView(PATH_CUSTOM + "customDetail");
		
		if(id != null){
			CustomVO customDetail = customService.findCustomById(id);
			CustomerVO customer = null;
			String openid = null;
			OrderVO orderVO = null;
			if(customDetail != null){
				Integer orderId = customDetail.getOrderId();
				if(orderId != null){
					orderVO = orderService.findSigleOrder(orderId);
					model.addObject("orderStatus", orderService.getOrderStatusById(orderId));
				}
				customer = customerService.findCustomerById(customDetail.getCustomerId());
			}
			if(customer != null){
				openid = customer.getVopenid();
			}
			
			LoginVO loginInfo = (LoginVO) session.getAttribute("loginInfo");
			String shop = null;
			if(loginInfo != null){
				if(StringUtil.isEmpty(((LoginVO)loginInfo).getUserId())){
					model.setViewName("common/confirm");
				}
				shop = loginInfo.getShop();
			}else{
				model.setViewName("common/confirm");
			}
			
			List<CustomCVO> customCVO = customService.findListCustomC(id);
			List<CustomDVO> customDVO = customService.findListCustomD(id);
			
			JSONArray chainJson = JSONArray.fromObject(customCVO);
			JSONArray stockGemJson = JSONArray.fromObject(customDVO);
			
			model.addObject("customDetail", customDetail);
			model.addObject("shop", shop);
			model.addObject("orderVO", orderVO);
			model.addObject("openid", openid);
			model.addObject("chainJson", chainJson);
			model.addObject("stockGemJson", stockGemJson);
		}
		
		return model;
		
	}
	
	/**
	 * @Description: 款式单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("infoJson")
	public void infoJson(Map<String, Object> map, Integer id) {

		CustomVO customDetail = customService.findCustomById(id);
		renderJson(customDetail);
	}

	/**
	 * @Description: 保存或更新款式单信息
	 * @param @param customVO
	 * @return ModelAndView
	 */
	@RequestMapping("update")
	public void customUpdate(HttpServletRequest request) {

		Integer id = Integer.valueOf(request.getParameter("id"));
		String bvo = request.getParameter("bvo");
		String vh = request.getParameter("vh");
		String cad = request.getParameter("cad");
		
		if(bvo != null){
			customService.saveCustomB(id,bvo);
		}
		if(vh != null){
			customService.updateCustomVh(id, vh);
		}
		if(cad != null){
			customService.updateCustomCad(id, cad);
		}
		
		renderJson("{\"id\":"+id+"}");
	}
	
	
	/**
	 * @Description: 宝石签收单子表保存
	 * @param @param customVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public void customSave(HttpServletRequest request,CustomVO customVO){
		
		String bvo = request.getParameter("bvo");
		String cvo = request.getParameter("cvo");
		String dvo = request.getParameter("dvo");
		
		ArrayList<CustomCVO> listcvo = new ArrayList<CustomCVO>();
		ArrayList<CustomDVO> listdvo = new ArrayList<CustomDVO>();
		
		//链子
		JSONArray jsonCVO = JSONArray.fromObject(cvo);
		//宝石
		JSONArray jsonDVO = JSONArray.fromObject(dvo);
		
		//保存或更新主表
		boolean cms = true;
		Integer id = null;
		if(customVO != null){
			id = customVO.getId();
			if(id == null){
				id = customService.saveCustomRelID(customVO);
			}else{
				customService.updateCustom(customVO);
				cms = false;
			}
		}
		
		if(bvo != null){
			customService.saveCustomB(id,bvo);
		}
		
		// 链子子表保存
		if(!CommonUtils.isNull(jsonCVO)){
			
			Integer len = jsonCVO.size();
			for(int i = 0; i < len; i++){
				JSONObject sjson = jsonCVO.getJSONObject(i);
				String vchainName = sjson.getString("vchainName");
				Integer ichainItem = sjson.getInt("ichainItem");
				BigDecimal nchainCost = new BigDecimal(sjson.getString("nchainCost"));
				CustomCVO cvo_ = new CustomCVO();
				cvo_.setCustomId(customVO.id);
				cvo_.setVchainName(vchainName);
				cvo_.setIchainItem(ichainItem);
				cvo_.setNchainCost(nchainCost);
				listcvo.add(cvo_);
			}
		}
		if(listcvo != null){
			customService.deleteCustomC(customVO.id);
			customService.saveCustomC(listcvo);
		}
		
		// 库存宝石子表保存
		if(!CommonUtils.isNull(jsonDVO)){
			
			Integer len = jsonDVO.size();
			for(int i = 0; i < len; i++){
				JSONObject sjson = jsonDVO.getJSONObject(i);
				String vstockGemName = sjson.getString("vstockGemName");
				Integer istockGemNum = sjson.getInt("istockGemNum");
				String vstockGemImgPath = sjson.getString("vstockGemImgPath");
				BigDecimal nstockGemWeight = new BigDecimal(sjson.getString("nstockGemWeight"));
				String vstockGemShape = sjson.getString("vstockGemShape");
				String vstockGemSize = sjson.getString("vstockGemSize");
				String vstockGemColor = sjson.getString("vstockGemColor");
				String vstockGemClarity = sjson.getString("vstockGemClarity");
				BigDecimal nstockGemCost = new BigDecimal(sjson.getString("nstockGemCost"));
				CustomDVO dvo_ = new CustomDVO();
				dvo_.setCustomId(customVO.id);
				dvo_.setVstockGemName(vstockGemName);
				dvo_.setIstockGemNum(istockGemNum);
				dvo_.setVstockGemImgPath(vstockGemImgPath);
				dvo_.setNstockGemWeight(nstockGemWeight);
				dvo_.setVstockGemShape(vstockGemShape);
				dvo_.setVstockGemSize(vstockGemSize);
				dvo_.setVstockGemColor(vstockGemColor);
				dvo_.setVstockGemClarity(vstockGemClarity);
				dvo_.setNstockGemCost(nstockGemCost);
				listdvo.add(dvo_);
			}
		}
		if(listdvo != null){
			customService.deleteCustomD(customVO.id);
			customService.saveCustomD(listdvo);
		}
		
		//回写款式单ID
		if(cms){
			orderService.backWriteByCum(customVO.getOrderId(), customVO.getId());
		}
		renderJson("{\"id\":"+customVO.id+"}");
	}
	

	/**
	 * @Description: 获取款式单列表
	 * @param @param map
	 * @return ModelAndView
	 */
	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map,String listType) {
		ModelAndView model = new ModelAndView(PATH_CUSTOM + "customList");
		model.addObject("listType", listType);
		return model;
	}
	
	/**
	 * @Description: 获取款式单列表JSON
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="listJson")
	public void listJson(HttpServletRequest request,Map<String, Object> map) {
		String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " and a.vcustom_code like '%"+content+"%' or c.vname like '%"+content+"%' or c.vphone_code like '%"+content+"%'";
		}
		
		/**角色权限控制--开始**/
		wh = getAuthSQL(wh,"c.vservice_code","c.to_userids");
		/**角色权限控制--结束**/
		
		List<CustomVO> customList = customService.findCustomByWh(wh);
		renderJson(customList);
	}
	
	@RequestMapping(value="/getGem")
	public void getGem(@RequestParam(value="id",required=false) Integer id){
		
		GemSignVO gemSignVO = gemSignService.findSigleGem(id);
		
		renderJson(gemSignVO);
	}
	
}
