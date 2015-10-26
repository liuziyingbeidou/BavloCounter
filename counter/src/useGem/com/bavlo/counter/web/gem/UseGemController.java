package com.bavlo.counter.web.gem;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.gem.UseGemVO;
import com.bavlo.counter.service.gem.itf.IUseGemService;
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
	 * @Description: 客户详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		List<UseGemVO> useGemList = useGemService.findUseGemList();
		map.put("useGemList", useGemList);

		UseGemVO useGemDetail = useGemService.findUseGemById(id);
		map.put("useGemDetail", useGemDetail);
		return new ModelAndView(PATH_USE_GEM + "useGemEdit");
	}

	/**
	 * @Description: 保存或更新客户信息
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
	 * @Description: 获取客户列表
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
