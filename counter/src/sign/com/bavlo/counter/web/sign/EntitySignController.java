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
 * @Title: 宝珑Counter
 * @ClassName: EntitySignController 
 * @Description: 实物签收单Controller
 * @author liuzy
 * @date 2015-10-19 下午03:30:17
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
	 * @Description: 重定向到新增界面
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
	 * @Description: 宝石签收单保存
	 * @param @param gemSignVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save")
	public void entitySave(EntitySignVO entitySignVO){
		System.out.println("正在保存....");
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
