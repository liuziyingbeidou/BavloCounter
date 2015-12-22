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
		model.addObject("number", CommonUtils.getBillCode("CM"));
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
					orderVO = orderService.findSigleOrder(customDetail.getOrderId());
					System.out.println(orderVO.getNquotedPrice());
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
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(CustomVO customVO) {

		customService.saveOrUpdateCustom(customVO);
		return REDIRECT + "custom/edit.do";
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
		
		ArrayList<CustomBVO> listbvo = new ArrayList<CustomBVO>();
		ArrayList<CustomCVO> listcvo = new ArrayList<CustomCVO>();
		ArrayList<CustomDVO> listdvo = new ArrayList<CustomDVO>();
		
		//图片
		JSONObject jsonBVO = JSONObject.fromObject(bvo);
		//链子
		JSONArray jsonCVO = JSONArray.fromObject(cvo);
		//宝石
		JSONArray jsonDVO = JSONArray.fromObject(dvo);
		
		//保存或更新主表
		//customService.saveOrUpdateCustom(customVO);
		Integer id = customVO.getId();
		boolean cms = true;
		if(id == null){
			id = customService.saveCustomRelID(customVO);
		}else{
			customService.updateCustom(customVO);
			cms = false;
		}
		
		//图片子表保存
		String filemodel = jsonBVO.get("filemodel") + "";
		String vtype = jsonBVO.get("vtype") + "";
		String FILE_0 = jsonBVO.get("FILE_0") + "";
		if(StringUtil.isNotEmpty(FILE_0)){
			CustomBVO bvo_0 = new CustomBVO();
			bvo_0.setCustomId(customVO.id);
			bvo_0.setVname(FILE_0);
			bvo_0.setVpath(filemodel);
			bvo_0.setVtype(vtype);
			bvo_0.setBiscover(IConstant.YES);
			listbvo.add(bvo_0);
		}
		String FILE_1 = jsonBVO.get("FILE_1") + "";
		if(StringUtil.isNotEmpty(FILE_1)){
			CustomBVO bvo_1 = new CustomBVO();
			bvo_1.setCustomId(customVO.id);
			bvo_1.setVname(FILE_1);
			bvo_1.setVtype(vtype);
			bvo_1.setVpath(filemodel);
			listbvo.add(bvo_1);
		}
		String FILE_2 = jsonBVO.get("FILE_2") + "";
		if(StringUtil.isNotEmpty(FILE_2)){
			CustomBVO bvo_2 = new CustomBVO();
			bvo_2.setCustomId(customVO.id);
			bvo_2.setVname(FILE_2);
			bvo_2.setVtype(vtype);
			bvo_2.setVpath(filemodel);
			listbvo.add(bvo_2);
		}
		String FILE_3 = jsonBVO.get("FILE_3") + "";
		if(StringUtil.isNotEmpty(FILE_3)){
			CustomBVO bvo_3 = new CustomBVO();
			bvo_3.setCustomId(customVO.id);
			bvo_3.setVname(FILE_3);
			bvo_3.setVtype(vtype);
			bvo_3.setVpath(filemodel);
			listbvo.add(bvo_3);
		}
		String FILE_4 = jsonBVO.get("FILE_4") + "";
		if(StringUtil.isNotEmpty(FILE_4)){
			CustomBVO bvo_4 = new CustomBVO();
			bvo_4.setCustomId(customVO.id);
			bvo_4.setVname(FILE_4);
			bvo_4.setVtype(vtype);
			bvo_4.setVpath(filemodel);
			listbvo.add(bvo_4);
		}
		String FILE_5 = jsonBVO.get("FILE_5") + "";
		if(StringUtil.isNotEmpty(FILE_5)){
			CustomBVO bvo_5 = new CustomBVO();
			bvo_5.setCustomId(customVO.id);
			bvo_5.setVname(FILE_5);
			bvo_5.setVtype(vtype);
			bvo_5.setVpath(filemodel);
			listbvo.add(bvo_5);
		}
		String FILE_6 = jsonBVO.get("FILE_6") + "";
		if(StringUtil.isNotEmpty(FILE_6)){
			CustomBVO bvo_6 = new CustomBVO();
			bvo_6.setCustomId(customVO.id);
			bvo_6.setVname(FILE_6);
			bvo_6.setVtype(vtype);
			bvo_6.setVpath(filemodel);
			listbvo.add(bvo_6);
		}
		String FILE_7 = jsonBVO.get("FILE_7") + "";
		if(StringUtil.isNotEmpty(FILE_7)){
			CustomBVO bvo_7 = new CustomBVO();
			bvo_7.setCustomId(customVO.id);
			bvo_7.setVname(FILE_7);
			bvo_7.setVtype(vtype);
			bvo_7.setVpath(filemodel);
			listbvo.add(bvo_7);
		}
		String FILE_8 = jsonBVO.get("FILE_8") + "";
		if(StringUtil.isNotEmpty(FILE_8)){
			CustomBVO bvo_8 = new CustomBVO();
			bvo_8.setCustomId(customVO.id);
			bvo_8.setVname(FILE_8);
			bvo_8.setVtype(vtype);
			bvo_8.setVpath(filemodel);
			listbvo.add(bvo_8);
		}
		String type = jsonBVO.get("vtype") + "";
		if(listbvo != null && StringUtil.isNotEmpty(type)){
			customService.deleteCustomB(id,type);
			customService.saveCustomB(listbvo);
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
