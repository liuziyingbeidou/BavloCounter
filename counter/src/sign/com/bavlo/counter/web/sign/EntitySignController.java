package com.bavlo.counter.web.sign;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.model.sign.SignVO;
import com.bavlo.counter.service.sign.itf.ISignService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: EntitySignController 
 * @Description: ʵ��ǩ�յ�Controller
 * @author liuzy
 * @date 2015-10-19 ����03:30:17
 */
@Controller("entitySignController")
@RequestMapping(value = "/entysign")
public class EntitySignController extends BaseController {

	@Resource
	private ISignService signService;

	@RequestMapping(value="getAllSign")
	public String getAllSign(){
		System.out.println("���ڲ�ѯǩ�յ���Ϣ...");
		
		List<SignVO> listSign = signService.findList();
		
		
		return "test";
	}
}
