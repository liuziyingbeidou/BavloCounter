package com.bavlo.counter.web.sign;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.EntitySignVO;
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
	
	/**
	 * @Description: 保存实物签收单
	 * @param @param signVO
	 * @param @return
	 * @return String
	 */
	@RequestMapping(value="saveEntySign")
	public String SaveEntitySign(EntitySignVO entitySignVO){
		
		System.out.println("实物类型："+entitySignVO.getVtype());
		entitySignService.signSave(entitySignVO);
		return IConstant.PATH_ENTITY + "entity-sign-view";
	}
	
}
