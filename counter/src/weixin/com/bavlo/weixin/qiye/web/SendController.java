package com.bavlo.weixin.qiye.web;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.model.relation.RelationVO;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.service.relation.itf.IRelationService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.util.Constants;
import com.bavlo.weixin.qiye.util.QiYeUtil;
import com.bavlo.weixin.qiye.util.WechatDepart;
import com.bavlo.weixin.qiye.util.WechatSendMessage;

/**
 * @author shiJf 发送消息控制类
 *
 */
@Controller
public class SendController extends BaseController{
	
	@Resource
	IOrderService orderService;
	
	@Resource
	private ICustomerService customerService;
	
	@Resource
	private IRelationService relationService;

	/**
	 * @Description: 转发页面 
	 * @param @param request
	 * @param @param touser
	 * @param @param toparty
	 * @param @param totag
	 * @param @param agentid
	 * @param @param text 
	 * @param @param memo 
	 * @param @param pageType
	 * @param @param rootPath 
	 * @param @param id 
	 * @return void
	 */
	@RequestMapping("/sendMassage.do")
	public void sendMassage(HttpServletRequest request,String touser, String toparty, String totag,
			String agentid, String text,String memo,String pageAttr,String pageCode,String rootPath,Integer id,Integer customerId) {
		boolean isTurn = true;
		String url = "http://"+Constants.REQURL +"/index.do";
		String actionName = "";//转发URL
		String actionPsn = "SYSTEM";//当前人员
		Object info = request.getSession().getAttribute("loginInfo");
		LoginVO loginVO = null;
		if(info != null){
			loginVO = (LoginVO)info;
			actionPsn = loginVO.getUserId();
		}else{
			renderText("-1");
		}
		CustomerVO vo = customerService.findCustomerById(customerId);
		
		JSONObject  obj = WechatDepart.getUserInfo(request,actionPsn);
		String uname = obj.getString("name");
		//客户(cust)
		if(IConstant.PAGE_ATTR_CUST.equals(pageAttr)){
			text = vo.getVname()+" 的基本信息(转发人-" + actionPsn + ")";
			actionName = "customer/info.do?id="+id;
		}else
		//定制单(style)
		if(IConstant.PAGE_ATTR_STYLE.equals(pageAttr)){
			text = "Hi, 我是 "+uname+"("+loginVO.getRole()+")"+" 已上传款式单"+pageCode+"。";// + DateUtil.getCurDateTime()+")";
			actionName = "custom/detail.do?id="+id;
		}else
		//订单(order)
		if(IConstant.PAGE_ATTR_ORDER.equals(pageAttr)){
			text = "Hi, 我是 "+uname+"("+loginVO.getRole()+")"+" 已上传订单"+pageCode+"。";// + DateUtil.getCurDateTime()+")";
			actionName = "order/view.do?id="+id;
			
			//PMC发给PPS订单进入制版态
			List<String> actionRole = loginVO.getRole();//当前人员角色
			if(actionRole != null){
				for (String string : actionRole) {
					//当前角色PMC
					if(IConstant.ROLE_PMC.equals(string)){
						Map<String,Object> mapRoleTag = QiYeUtil.getUserTag(request,touser);
						List<String> listRoleTag = mapRoleTag.get("roleTag") != null ? (List<String>)mapRoleTag.get("roleTag") : null;
						if(listRoleTag != null){
							for (String string2 : listRoleTag) {
								//接收方角色PPS
								if(IConstant.ROLE_PPS.equals(string2)){
									//改变订单状态为"制版"
									orderService.updateOrderState(id,IConstant.ORDER_PLATE);
								}
							}
						}
					}
				}
			}
		}else
		//宝石签收单(gem)
		if(IConstant.PAGE_ATTR_GEM.equals(pageAttr)){
			text = "Hi, 我是 "+uname+"("+loginVO.getRole()+")"+" 已上传宝石签收单"+pageCode+"。";// + DateUtil.getCurDateTime()+")";
			actionName = "gem-sign/view.do?id="+id;
		}else
		//实物签收单(entity)
		if(IConstant.PAGE_ATTR_ENTITY.equals(pageAttr)){
			text = "Hi, 我是 "+uname+"("+loginVO.getRole()+")"+" 已上传实物签收单"+pageCode+"。";// + DateUtil.getCurDateTime()+")";
			actionName = "entity-sign/view.do.id="+id;
		}else
		//配石单(deploy)
		if(IConstant.PAGE_ATTR_DEPLOY.equals(pageAttr)){
			text = "Hi, 我是 "+uname+"("+loginVO.getRole()+")"+" 已上传配石单"+pageCode+"。";// + DateUtil.getCurDateTime()+")";
		}else{
			isTurn = false;
		}
		url = rootPath + "/" + actionName;

		Integer result = -1;
		if(isTurn){
			//将转发对象userid追加到客户表toUserids中
			String condition = " toUserids like '%"+touser+"%'";
			if(!customerService.isExistByCondition(condition)){
				//CustomerVO vo = customerService.findCustomerById(customerId);
				if(vo != null){
					String vl = vo.getToUserids() + "["+touser+"]";
					customerService.updateCustomerByCondition(" id="+customerId, new String[]{"toUserids"}, new String[]{vl});
				}
			}
			if(!CommonUtils.isNull(touser)){
				result = WechatSendMessage.sendMassage(request,touser, "@all", "@all", Constants.AGENTID+"", text,memo,url);
			}
		}
		RelationVO relationVO = new RelationVO();
		relationVO.setVfromUser(actionPsn);
		relationVO.setVtoUser(touser);
		relationVO.setVpageType(pageAttr);
		relationVO.setVurl(url);
		relationVO.setVmemo(memo);
		relationVO.setIstatus(0);
		relationService.saveOrUpdateRelation(relationVO);
		renderText(result+"");
	}

}
