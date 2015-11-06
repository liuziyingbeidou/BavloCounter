package com.bavlo.counter.web.custom;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
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
	 * @Description: 定制单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		CustomVO customDetail = customService.findCustomById(id);
		map.put("customDetail", customDetail);
		return new ModelAndView(PATH_CUSTOM + "customEdit");
	}

	/**
	 * @Description: 保存或更新定制单信息
	 * @param @param customVO
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(CustomVO customVO) {

		customService.saveOrUpdateCustom(customVO);
		return REDIRECT + "custom/info.do";
	}

	/**
	 * @Description: 获取定制单列表
	 * @param @param map
	 * @return ModelAndView
	 */
	@RequestMapping("list")
	public ModelAndView getList(Map<String, Object> map) {

		List<CustomVO> customList = customService.findCustomList();
		map.put("customList", customList);

		return new ModelAndView(PATH_CUSTOM + "customList");
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
