package com.bavlo.counter.web.customer;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.LoginVO;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.fuwu.util.IContant;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomerController
 * @Description: 客户控制器
 * @author shijf
 * @date 2015-10-20 下午04:00:41
 */
@RequestMapping("customer")
@Controller
public class CustomerController extends BaseController implements IConstant {

	@Resource
	private ICustomerService customerService;

	/**
	 * @Description: 客户详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("/info.do")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		CustomerVO customerDetail = customerService.findCustomerById(id);
		if(id != null){
			map.put("pageOrderType", IConstant.PAGE_TYPE_EDIT);
		}else{
			//编号
			map.put("number", CommonUtils.getBillCode(IConstant.CODE_CUSTER));
			map.put("pageOrderType", IConstant.PAGE_TYPE_ADD);
		}
		map.put("customerDetail", customerDetail);
		return new ModelAndView(PATH_CUSTOMER + "customerEdit");
	}
	
	/**
	 * @Description: 客户详情
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("/infoJson.do")
	public void infoJson(Map<String, Object> map, Integer id) {

		CustomerVO customerDetail = customerService.findCustomerById(id);
		renderJson(customerDetail);
	}

	/**
	 * @Description: 该手机号是否已注册
	 * @param @param vphone
	 * @return void
	 */
	@RequestMapping("isExistByPhone")
	public void isExistByPhone(String vphone){
		boolean isg = true;
		if(!CommonUtils.isNull(vphone)){
			CustomerVO vo = customerService.findCustomerByWhere(" vphoneCode ='"+vphone+"'");
			if(vo != null){
				isg = false;
			}
		}
		renderJson("{\"isExist\":"+isg+"}");
	}
	
	
	/**
	 * @Description: 保存或更新客户信息
	 * @param @param customerVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public void saveOrUpdate(CustomerVO customerVO) {
		if(StringUtil.isEmpty(customerVO.getVserviceCode())){
			//非微信扫码添加
			Object lgObj = request.getSession().getAttribute("loginInfo");
			if(lgObj != null){
				//当前登录人信息
				LoginVO lgInfo = (LoginVO)lgObj;
				customerVO.setVserviceCode(lgInfo.getKfcode());
			}
		}
		Integer id = customerVO.getId();
		if(id == null){
			id = customerService.saveCustomer(customerVO);
		}else{
			customerService.saveOrUpdateCustomer(customerVO);
		}
		
		//return REDIRECT + "customer/info.do";
		renderJson("{\"id\":"+id+"}");
	}

	/**
	 * @Description: 获取客户列表
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/list.do")
	public ModelAndView list(HttpServletRequest request,Map<String, Object> map) {
		String listType = request.getParameter("listType");
		/*String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " vname like '%"+content+"%' or vphoneCode like '%"+content+"%'";
		}
		List<CustomerVO> customerList = customerService.findCustomerList(wh);
		map.put("customerList", customerList);*/
		ModelAndView model = new ModelAndView(PATH_CUSTOMER + "customerList");
		model.addObject("listType", listType);
		return model;
	}
	
	/**
	 * @Description: 获取客户列表JSON
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="listJson",method = RequestMethod.POST)
	public void listJson(HttpServletRequest request,Map<String, Object> map) {
		String content = request.getParameter("content");
		String wh = "";
		if(StringUtil.isNotEmpty(content)){
			wh = " vcustomerCode like '%"+content+"%' or vname like '%"+content+"%' or vphoneCode like '%"+content+"%'";
		}else{
			wh = " 1=1 ";
		}
		/**角色权限控制--开始**/
		wh = getAuthSQL(wh,"vserviceCode","to_userids");
		/*Object lgObj = request.getSession().getAttribute("loginInfo");
		if(lgObj != null){
			//当前登录人信息
			LoginVO lgInfo = (LoginVO)lgObj;
			List<String> roleList = lgInfo.getRole();
			if(roleList != null){
				//非PM
				if(!roleList.contains(IConstant.ROLE_PM)){
					//当前登录定制顾问下的客户
					wh += " and vserviceCode ='"+lgInfo.getKfcode()+"'";
				}
			}else{
				wh = " 1=2";
			}
		}else{
			wh = " 1=2";
		}*/
		/**角色权限控制--结束**/
		List<CustomerVO> customerList = customerService.findCustomerList(wh);
		renderJson(customerList);
	}

}
