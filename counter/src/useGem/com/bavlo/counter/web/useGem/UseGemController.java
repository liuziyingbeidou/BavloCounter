package com.bavlo.counter.web.useGem;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.useGem.itf.IUseGemService;
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

	/**
	 * @Description: 配石单详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		List<UseGemVO> useGemList = useGemService.findUseGemList();
		UseGemVO useGemDetail = useGemService.findUseGemById(id);
		
		map.put("useGemList", useGemList);
		map.put("useGemDetail", useGemDetail);
		return new ModelAndView(PATH_USE_GEM + "useGemEdit");
	}

	/**
	 * @Description: 保存或更新配石单信息
	 * @param @param useGemVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(UseGemVO useGemVO) {

		useGemService.saveOrUpdateUseGem(useGemVO);
		return REDIRECT + "useGem/info.do";
	}

	/**
	 * @Description: 获取配石单列表
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map) {

		List<UseGemVO> useGem = useGemService.findUseGemList();
		map.put("useGem", useGem);
		return new ModelAndView(PATH_USE_GEM + "useGemList");
	}

}
