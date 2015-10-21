package com.bavlo.counter.web.sign;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.sign.itf.IGemSignService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: 宝珑Counter
 * @ClassName: GemSignController 
 * @Description: 宝石签收单
 * @author liuzy
 * @date 2015-10-21 上午11:42:17
 */
@Controller
@RequestMapping(value="/gem-sign")
public class GemSignController extends BaseController {
	
	@Resource
	private IGemSignService gemSignService;
	
	/**
	 * @Description: 重定向到新增界面
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/add")
	public ModelAndView gemAdd(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_GEM + "gem-sign-edit");
		model.addObject("pageGemType", IConstant.PAGE_TYPE_ADD);
		return model;
	}
	
	/**
	 * @Description: 宝石签收单保存
	 * @param @param gemSignVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save")
	public ModelAndView gemSave(GemSignVO gemSignVO){
		System.out.println("正在保存....");
		
		Integer id = gemSignService.saveRelId(gemSignVO);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_GEM + "gem-sign-view");
		model.addObject("pageGemType", IConstant.PAGE_TYPE_ADD);
		return model;
	}
}
