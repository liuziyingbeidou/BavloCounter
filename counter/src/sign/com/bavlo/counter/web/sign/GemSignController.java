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
 * @Title: ����Counter
 * @ClassName: GemSignController 
 * @Description: ��ʯǩ�յ�
 * @author liuzy
 * @date 2015-10-21 ����11:42:17
 */
@Controller
@RequestMapping(value="/gem-sign")
public class GemSignController extends BaseController {
	
	@Resource
	private IGemSignService gemSignService;
	
	/**
	 * @Description: �ض�����������
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
	 * @Description: ��ʯǩ�յ�����
	 * @param @param gemSignVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save")
	public ModelAndView gemSave(GemSignVO gemSignVO){
		System.out.println("���ڱ���....");
		
		Integer id = gemSignService.saveRelId(gemSignVO);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_GEM + "gem-sign-view");
		model.addObject("pageGemType", IConstant.PAGE_TYPE_ADD);
		return model;
	}
}
