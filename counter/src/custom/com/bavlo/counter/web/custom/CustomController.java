package com.bavlo.counter.web.custom;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;

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
	private ICustomService customService;

	/**
	 * @Description: 定制单编辑
	 * @param @return
	 * @return ModelAndView
	 * orderId=1&customerId=1
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Map<String, Object> map, Integer id, Integer orderId, Integer customerId) {

		CustomVO customEdit = customService.findCustomById(id);
		if(customEdit == null){
			customEdit = new CustomVO();
		}
		if(orderId != null){
			customEdit.setOrderId(orderId);
		}
		if(customerId != null){
			customEdit.setCustomerId(customerId);
		}
		map.put("customEdit", customEdit);
		return new ModelAndView(PATH_CUSTOM + "customEdit");
	}
	
	/**
	 * @Description: 定制单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("detail")
	public ModelAndView detail(Map<String, Object> map, Integer id) {
		
		CustomVO customDetail = customService.findCustomById(id);
		map.put("customDetail", customDetail);
		return new ModelAndView(PATH_CUSTOM + "customDetail");
	}
	
	/**
	 * @Description: 定制单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("infoJson")
	public void infoJson(Map<String, Object> map, Integer id) {

		CustomVO customDetail = customService.findCustomById(id);
		renderJson(customDetail);
	}

	/**
	 * @Description: 保存或更新定制单信息
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
	public void costomSave(HttpServletRequest request,CustomVO customVO){
		System.out.println("正在保存....");
		
		String bvo = request.getParameter("bvo");
		
		customService.saveOrUpdateCustom(customVO);
		
		//子表保存
		ArrayList<CustomBVO> listbvo = new ArrayList<CustomBVO>();
		JSONObject jsonBVO = JSONObject.fromObject(bvo);
		String filemodel = jsonBVO.get("filemodel") + "";
		String FILE_0 = jsonBVO.get("FILE_0") + "";
		if(StringUtil.isNotEmpty(FILE_0)){
			CustomBVO bvo_0 = new CustomBVO();
			bvo_0.setCustomId(customVO.id);
			bvo_0.setVname(FILE_0);
			bvo_0.setVpath(filemodel);
			bvo_0.setBiscover(IConstant.YES);
			listbvo.add(bvo_0);
		}
		String FILE_1 = jsonBVO.get("FILE_1") + "";
		if(StringUtil.isNotEmpty(FILE_1)){
			CustomBVO bvo_1 = new CustomBVO();
			bvo_1.setCustomId(customVO.id);
			bvo_1.setVname(FILE_1);
			bvo_1.setVpath(filemodel);
			listbvo.add(bvo_1);
		}
		String FILE_2 = jsonBVO.get("FILE_2") + "";
		if(StringUtil.isNotEmpty(FILE_2)){
			CustomBVO bvo_2 = new CustomBVO();
			bvo_2.setCustomId(customVO.id);
			bvo_2.setVname(FILE_2);
			bvo_2.setVpath(filemodel);
			listbvo.add(bvo_2);
		}
		String FILE_3 = jsonBVO.get("FILE_3") + "";
		if(StringUtil.isNotEmpty(FILE_3)){
			CustomBVO bvo_3 = new CustomBVO();
			bvo_3.setCustomId(customVO.id);
			bvo_3.setVname(FILE_3);
			bvo_3.setVpath(filemodel);
			listbvo.add(bvo_3);
		}
		String FILE_4 = jsonBVO.get("FILE_4") + "";
		if(StringUtil.isNotEmpty(FILE_4)){
			CustomBVO bvo_4 = new CustomBVO();
			bvo_4.setCustomId(customVO.id);
			bvo_4.setVname(FILE_4);
			bvo_4.setVpath(filemodel);
			listbvo.add(bvo_4);
		}
		String FILE_5 = jsonBVO.get("FILE_5") + "";
		if(StringUtil.isNotEmpty(FILE_5)){
			CustomBVO bvo_5 = new CustomBVO();
			bvo_5.setCustomId(customVO.id);
			bvo_5.setVname(FILE_5);
			bvo_5.setVpath(filemodel);
			listbvo.add(bvo_5);
		}
		String FILE_6 = jsonBVO.get("FILE_6") + "";
		if(StringUtil.isNotEmpty(FILE_6)){
			CustomBVO bvo_6 = new CustomBVO();
			bvo_6.setCustomId(customVO.id);
			bvo_6.setVname(FILE_6);
			bvo_6.setVpath(filemodel);
			listbvo.add(bvo_6);
		}
		String FILE_7 = jsonBVO.get("FILE_7") + "";
		if(StringUtil.isNotEmpty(FILE_7)){
			CustomBVO bvo_7 = new CustomBVO();
			bvo_7.setCustomId(customVO.id);
			bvo_7.setVname(FILE_7);
			bvo_7.setVpath(filemodel);
			listbvo.add(bvo_7);
		}
		String FILE_8 = jsonBVO.get("FILE_8") + "";
		if(StringUtil.isNotEmpty(FILE_8)){
			CustomBVO bvo_8 = new CustomBVO();
			bvo_8.setCustomId(customVO.id);
			bvo_8.setVname(FILE_8);
			bvo_8.setVpath(filemodel);
			listbvo.add(bvo_8);
		}
		
		customService.deleteCustomB(customVO.id);
		customService.saveCustomB(listbvo);
		
		renderJson("{\"id\":"+customVO.id+"}");
	}
	

	/**
	 * @Description: 获取定制单列表
	 * @param @param map
	 * @return ModelAndView
	 */
	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map) {

		return new ModelAndView(PATH_CUSTOM + "customList");
	}
	
	/**
	 * @Description: 获取定制单列表JSON
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="listJson")
	public void listJson(HttpServletRequest request,Map<String, Object> map) {
		String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " vname like '%"+content+"%' or vphoneCode like '%"+content+"%'";
		}
		List<CustomVO> customList = customService.findCustomList(wh);
		renderJson(customList);
	}

	@RequestMapping("/calculate")
	@ResponseBody
	public String calculate(Long metalId, Long typeId, BigDecimal metalWeight,
			BigDecimal pmPrice, BigDecimal mainGemPrice, BigDecimal inlayPrice,
			BigDecimal otherPrice, BigDecimal reportPrice,
			BigDecimal expressPrice, BigDecimal insuranceRate,
			BigDecimal chainPrice, String stockGemPrice, HttpSession session,
			HttpServletRequest request) {

		StringBuffer sb = new StringBuffer();
		sb.append("{");
		// 执模（Finshing）
		BigDecimal finshingCost = new BigDecimal(0);
		// 铸造（Casting）
		BigDecimal castingCost = new BigDecimal(0);
		// 喷蜡成本
		BigDecimal prototypingCost = new BigDecimal(0);
		// 模型体积
		BigDecimal volume = new BigDecimal(0);
		// 库选宝石成本
		BigDecimal sgPrice = new BigDecimal(0);
		// 总成本
		BigDecimal totalCost = new BigDecimal(0);
		// 金属加工费
		BigDecimal makePrice = new BigDecimal(0);
		// 金属成本
		BigDecimal metalPrice = new BigDecimal(0);
		// 保费
		BigDecimal insurancePrice = new BigDecimal(0);
		if (stockGemPrice != null && !"".equals(stockGemPrice)) {
			String sgp[] = stockGemPrice.split(";");
			if (sgp.length > 0) {
				for (String str : sgp) {
					sgPrice = sgPrice.add(new BigDecimal(str));
				}
			}
		}
//		MetalMaterialType metal = MetalMaterialType
//				.findMetalMaterialType(metalId);
//		volume = volume.add(metalWeight.divide(metal.getDensity(), 2));
//		prototypingCost = prototypingCost.add((volume.multiply(new BigDecimal(
//				0.00096))).multiply(
//				ProcessingCost.findProcessingCost(new Long(1)).getCostRate())
//				.setScale(2, 1));
//		castingCost = castingCost.add(metalWeight.multiply(ProcessingCost
//				.findProcessingCost(new Long(2)).getCostRate()));
//		if (metalId == 5) {
//			finshingCost = finshingCost.add(metalWeight
//					.multiply(new BigDecimal(30)));
//		} else {
//			finshingCost = finshingCost.add(ProcessingCost
//					.findProcessingCostByWeightAndType(
//							metalWeight.doubleValue(), typeId).getCostRate());
//		}
		makePrice = makePrice.add(castingCost).add(finshingCost);
//		metalPrice = metalWeight.multiply(metal.getCost());
		totalCost = totalCost.add(prototypingCost).add(castingCost)
				.add(finshingCost).add(mainGemPrice)
				.add(inlayPrice).add(reportPrice)
				.add(expressPrice).add(chainPrice)
				.add(sgPrice).add(metalPrice).add(new BigDecimal(110))
				.setScale(2, RoundingMode.CEILING);
		insurancePrice = totalCost.multiply(insuranceRate).setScale(2,
				RoundingMode.CEILING);
		;
		totalCost = totalCost.divide((new BigDecimal(1)).subtract(new BigDecimal(0.15)),
				RoundingMode.HALF_EVEN).add(insurancePrice).setScale(2, RoundingMode.UP);
		totalCost = totalCost.add(pmPrice).add(otherPrice);
		BigDecimal price = new BigDecimal(0);
//		price = price.add(totalCost.divide(
//				(new BigDecimal(1)).subtract(agent.getCustomizeRate()),
//				RoundingMode.HALF_EVEN).setScale(-1, RoundingMode.UP));
//				price = price.subtract(new BigDecimal(1));
		sb.append("\"makePrice\":\"" + makePrice + "\",");
		sb.append("\"metalPrice\":\"" + metalPrice + "\",");
		sb.append("\"expressPrice\":\"" + insurancePrice.add(expressPrice)
				+ "\",");
		sb.append("\"cost\":\"" + totalCost + "\",");
		sb.append("\"price\":\"" + price + "\"}");
		return sb.toString();
	}
	
}
