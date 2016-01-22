package com.bavlo.counter.web.relation;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.model.relation.RelationVO;
import com.bavlo.counter.service.relation.itf.IRelationService;
import com.bavlo.counter.web.BaseController;


/** 
 * @Title: ����Counter
 * @ClassName: ������ϵ������
 * @Description: TODO(������һ�仰��������������) 
 * @author shijf
 * @date 2016��1��20�� ����3:42:40  
 */
@Controller
@RequestMapping("relation")
public class RelationController extends BaseController {
	
	@Resource
	public IRelationService relationService;
	
	@RequestMapping("getList")
	public ModelAndView getList(String listType){
		ModelAndView model = new ModelAndView("relation/relationList");
		String toUser = "";
		List<RelationVO> relationList = null;
		LoginVO loginInfo = (LoginVO) session.getAttribute("loginInfo");
		if(loginInfo != null){
			toUser = loginInfo.getUserId();
		}
		if(!"".equals(toUser)){
			relationList = relationService.findRelationByToUser(toUser);
		}
		relationList = relationService.findRelationByToUser("shijianfeng");
		JSONArray relationJson = JSONArray.fromObject(relationList);
		model.addObject("relationJson", relationJson);
		return model;
	}
	
}
