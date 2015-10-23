package com.bavlo.counter.web.sign;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.sign.itf.IEntitySignService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: EntitySignController 
 * @Description: ʵ��ǩ�յ�Controller
 * @author liuzy
 * @date 2015-10-19 ����03:30:17
 */
@Controller("entitySignController")
@RequestMapping(value = "/entity-sign")
public class EntitySignController extends BaseController {
	
	@Resource
	private IEntitySignService entitySignService;
	
	@RequestMapping(value="/list")
	public ModelAndView entityList(){
		
		List<EntitySignVO> entityList = entitySignService.findListEntity();
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ENTITY + IConstant.ENTITY_SIGN_LIST);
		model.addObject("entityList", entityList);
		return model;
	}
	
	/**
	 * @Description: �ض�����������
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/add")
	public ModelAndView entityAdd(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ENTITY + IConstant.ENTITY_SIGN_EDIT);
		model.addObject("pageEntityType", IConstant.PAGE_TYPE_ADD);
		return model;
	}
	
	/**
	 * @Description: ��ʯǩ�յ�����
	 * @param @param gemSignVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save")
	public void entitySave(EntitySignVO entitySignVO){
		System.out.println("���ڱ���....");
		Integer id = entitySignVO.getId();
		if(id == null){
			id = entitySignService.saveEntityRelID(entitySignVO);
		}else{
			entitySignService.updateEntity(entitySignVO);
		}
		renderJson("{\"id\":"+id+"}");
	}
	
	@RequestMapping(value="/view")
	public ModelAndView entityView(@RequestParam(value="id",required=false) Integer id){
		
		EntitySignVO entitySignVO = entitySignService.findSigleEntity(id);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ENTITY + IConstant.ENTITY_SIGN_EDIT);
		model.addObject("pageEntityType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("entityvo",entitySignVO);
		return model;
	}
	
}
