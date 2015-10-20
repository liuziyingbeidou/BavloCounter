package com.bavlo.counter.web.sign;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.SignVO;
import com.bavlo.counter.service.sign.itf.ISignService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: 宝珑Counter
 * @ClassName: EntitySignController 
 * @Description: 实物签收单Controller
 * @author liuzy
 * @date 2015-10-19 下午03:30:17
 */
@Controller("entitySignController")
@RequestMapping(value = "/entysign")
public class EntitySignController extends BaseController {
	
	@Resource
	private ISignService signService;
	

	@RequestMapping(value="getAllSign")
	public String getAllSign(){
		System.out.println("正在查询签收单信息...");
		
		List<SignVO> listSign = signService.findList();
		
		return IConstant.PATH_ENTITY + "entity-sign-edit";
	}
	/**
	 * @Description: 保存实物签收单
	 * @param @param signVO
	 * @param @return
	 * @return String
	 */
	@RequestMapping(value="saveEntySign")
	public String SaveEntitySign(SignVO signVO){
		
		System.out.println("实物类型："+signVO.getVtype());
		signService.signSave(signVO);
		return IConstant.PATH_ENTITY + "entity-sign-view";
	}
	
}
