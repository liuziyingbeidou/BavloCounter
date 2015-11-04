package com.bavlo.counter.web.sign;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.EntitySignBVO;
import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.service.sign.itf.IEntitySignService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
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
		
		//List<EntitySignVO> entityList = entitySignService.findListEntity();
		
		ModelAndView model = new ModelAndView(IConstant.PATH_ENTITY + IConstant.ENTITY_SIGN_LIST);
		//model.addObject("entityList", entityList);
		return model;
	}
	
	@RequestMapping(value="/listJson",method = RequestMethod.POST)
	public void entityListJson(HttpServletRequest request){
		String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " a.vnumber like '%"+content+"%'";
		}
		
		List<EntitySignVO> gemList = entitySignService.findListEntityBySql(wh);
		renderJson(gemList);
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
		//编号
		model.addObject("number", CommonUtils.getBillCode(IConstant.CODE_ENTITYSIGN));
		return model;
	}
	
	/**
	 * @Description: 宝石签收单保存
	 * @param @param gemSignVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public void entitySave(HttpServletRequest request,EntitySignVO entitySignVO){
		System.out.println("正在保存....");
		
		String bvo = request.getParameter("bvo");
		
		Integer id = entitySignVO.getId();
		if(id == null){
			id = entitySignService.saveEntityRelID(entitySignVO);
		}else{
			entitySignService.updateEntity(entitySignVO);
		}
		
		//子表保存
		ArrayList<EntitySignBVO> listbvo = new ArrayList<EntitySignBVO>();
		JSONObject jsonBVO = JSONObject.fromObject(bvo);
		String filemodel = jsonBVO.get("filemodel") + "";
		String FILE_0 = jsonBVO.get("FILE_0") + "";
		if(StringUtil.isNotEmpty(FILE_0)){
			EntitySignBVO bvo_0 = new EntitySignBVO();
			bvo_0.setEntitysignId(id);
			bvo_0.setVname(FILE_0);
			bvo_0.setVpath(filemodel);
			bvo_0.setBiscover(IConstant.YES);
			listbvo.add(bvo_0);
		}
		String FILE_1 = jsonBVO.get("FILE_1") + "";
		if(StringUtil.isNotEmpty(FILE_1)){
			EntitySignBVO bvo_1 = new EntitySignBVO();
			bvo_1.setEntitysignId(id);
			bvo_1.setVname(FILE_1);
			bvo_1.setVpath(filemodel);
			listbvo.add(bvo_1);
		}
		String FILE_2 = jsonBVO.get("FILE_2") + "";
		if(StringUtil.isNotEmpty(FILE_2)){
			EntitySignBVO bvo_2 = new EntitySignBVO();
			bvo_2.setEntitysignId(id);
			bvo_2.setVname(FILE_2);
			bvo_2.setVpath(filemodel);
			listbvo.add(bvo_2);
		}
		String FILE_3 = jsonBVO.get("FILE_3") + "";
		if(StringUtil.isNotEmpty(FILE_3)){
			EntitySignBVO bvo_3 = new EntitySignBVO();
			bvo_3.setEntitysignId(id);
			bvo_3.setVname(FILE_3);
			bvo_3.setVpath(filemodel);
			listbvo.add(bvo_3);
		}
		String FILE_4 = jsonBVO.get("FILE_4") + "";
		if(StringUtil.isNotEmpty(FILE_4)){
			EntitySignBVO bvo_4 = new EntitySignBVO();
			bvo_4.setEntitysignId(id);
			bvo_4.setVname(FILE_4);
			bvo_4.setVpath(filemodel);
			listbvo.add(bvo_4);
		}
		String FILE_5 = jsonBVO.get("FILE_5") + "";
		if(StringUtil.isNotEmpty(FILE_5)){
			EntitySignBVO bvo_5 = new EntitySignBVO();
			bvo_5.setEntitysignId(id);
			bvo_5.setVname(FILE_5);
			bvo_5.setVpath(filemodel);
			listbvo.add(bvo_5);
		}
		String FILE_6 = jsonBVO.get("FILE_6") + "";
		if(StringUtil.isNotEmpty(FILE_6)){
			EntitySignBVO bvo_6 = new EntitySignBVO();
			bvo_6.setEntitysignId(id);
			bvo_6.setVname(FILE_6);
			bvo_6.setVpath(filemodel);
			listbvo.add(bvo_6);
		}
		String FILE_7 = jsonBVO.get("FILE_7") + "";
		if(StringUtil.isNotEmpty(FILE_7)){
			EntitySignBVO bvo_7 = new EntitySignBVO();
			bvo_7.setEntitysignId(id);
			bvo_7.setVname(FILE_7);
			bvo_7.setVpath(filemodel);
			listbvo.add(bvo_7);
		}
		String FILE_8 = jsonBVO.get("FILE_8") + "";
		if(StringUtil.isNotEmpty(FILE_8)){
			EntitySignBVO bvo_8 = new EntitySignBVO();
			bvo_8.setEntitysignId(id);
			bvo_8.setVname(FILE_8);
			bvo_8.setVpath(filemodel);
			listbvo.add(bvo_8);
		}
		
		entitySignService.deleteEntityB(id);
		entitySignService.saveEntityB(listbvo);
		
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
