package com.bavlo.weixin.qiye.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.service.itf.ICoreService;
import com.bavlo.weixin.qiye.util.QiYeUtil;

@Controller("qytagController")
@RequestMapping("/qy")
public class TagController extends BaseController{
	
	@Resource
	ICoreService coreService;
	
	/**
	 * @Description: 获取企业通讯录列表
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="list")
	public ModelAndView list(HttpServletRequest request,Map<String, Object> map) {
		String listType = request.getParameter("listType");
		String role = request.getParameter("role");
		ModelAndView model = new ModelAndView(IConstant.PATH_CUSTOMER + "innerCustomerList");
		model.addObject("listType", listType);
		model.addObject("role", role);
		return model;
	}
	
	/**
	 * @Description: 根据角色获取成员列表 
	 * @param @param tagName
	 * @return void
	 */
	@RequestMapping(value="getUserByTagName")
	public void getUserByTagName(HttpServletRequest request,String tagName){
		
		JSONArray roleJson = coreService.getRoleListByTagName(request,tagName);
		if(roleJson != null){
			renderJson(roleJson);
		}
	}
	
	
}
