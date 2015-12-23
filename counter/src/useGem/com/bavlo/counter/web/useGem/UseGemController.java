package com.bavlo.counter.web.useGem;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.custom.CustomDVO;
import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.useGem.itf.IUseGemService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: 宝珑Counter
 * @ClassName: UseGemController
 * @Description: 配石单控制器
 * @author shijf
 * @date 2015-10-23 上午11:49:18
 */
@RequestMapping("useGem")
@Controller
public class UseGemController extends BaseController implements IConstant {
	
	@Resource
	private IUseGemService useGemService;
	
	@Resource 
	private ICustomService customService;

	/**
	 * @Description: 配石单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info(Map<String, Object> map, Integer id,Integer did) {
		
		UseGemVO useGemDetail = null;
		//编号
		map.put("number", CommonUtils.getBillCode(IConstant.CODE_USEGEM));
		map.put("pageOrderType", IConstant.PAGE_TYPE_ADD);
		if(did == null){
			if(id != null){
				useGemDetail = useGemService.findUseGemById(id);
				did = useGemDetail.getCustomdId();
				map.put("pageOrderType", IConstant.PAGE_TYPE_EDIT);
			}
		}
		CustomDVO dvo = customService.findCustomDVOBySql(did);
		map.put("useGemDetail", useGemDetail);
		map.put("customDVO", dvo);
		return new ModelAndView(PATH_USE_GEM + "useGemEdit");
	}

	/**
	 * @Description: 保存或更新配石单信息
	 * @param @param useGemVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public void saveOrUpdate(UseGemVO useGemVO) {

		Integer id = useGemService.saveOrUpdateUseGem(useGemVO);
		
		renderJson("{\"id\":"+id+"}");
		
	}

	/**
	 * @Description: 获取配石单列表
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("list")
	public ModelAndView list(Map<String, Object> map) {

		return new ModelAndView(PATH_USE_GEM + "useGemList");
	}
	
	/**
	 * @Description: 获取配石单列表JSON
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="listJson",method = RequestMethod.POST)
	public void listJson(HttpServletRequest request,Map<String, Object> map) {
		String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " c.vcustom_code like '%"+content+"%' or a.vnumber like '%"+content+"%'";
		}
		List<UseGemVO> useGemList = useGemService.findUseGemList(wh);
		renderJson(useGemList);
	}

}
