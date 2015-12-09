package com.bavlo.counter.service.customer.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.weixin.fuwu.pojo.WeixinUserInfo;
import com.bavlo.weixin.fuwu.util.AdvancedUtil;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;


/** 
 * @Title: 宝珑Counter
 * @ClassName: CustomerService 
 * @Description: 客户service
 * @author shijf
 * @date 2015-10-20 下午04:12:30  
 */
@Service("CustomerService")
public class CustomerService extends CommonService implements ICustomerService {

	@Override
	public void saveCustomer(CustomerVO customerVO) {

	}

	@Override
	public void deleteCustomer(CustomerVO customerVO) {
		
	}

	@Override
	public void updateCustomer(CustomerVO customerVO) {
		
	}
	
	@Override
	public void saveOrUpdateCustomer(CustomerVO customerVO) {
		try {
			saveOrUpdate(customerVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CustomerVO findCustomerById(Integer id) {
		String wh = " id ="+id;
		return findFirst(CustomerVO.class, wh);
	}

	@Override
	public List<CustomerVO> findCustomerByWh() {
		return null;
	}

	@Override
	public List<CustomerVO> findCustomerList(String wh) {
	
		return findAll(CustomerVO.class, wh,null,"id","desc");
	}

	@Override
	public boolean isExistByCondition(String condition) {
		String conditions = null;
		if(StringUtil.isNotEmpty(condition)){
			conditions = condition;
		}
		Integer count = getCountByHQL(CustomerVO.class, conditions);
		
		return count > 0 ? true : false;
	}

	@Override
	public String addCustomerByScan(String openId,HttpSession session,String scene_str) {
		String vcode = null;
		if(!isExistByCondition(" vopenid = '"+openId+"'")){
			
			String serviceCode = scene_str.substring(scene_str.length()-4);
			String agentId = scene_str.substring(0,scene_str.length()-4);
			
			String accessToken = session.getAttribute("fw-accessToken")+"";
			if(CommonUtils.isNull(accessToken)){
				accessToken = CommonUtil.getToken(IContant.appId, IContant.appSecret).getAccessToken();
			}
			WeixinUserInfo userInfo = AdvancedUtil.getUserInfo(accessToken,openId);
			CustomerVO cvo = new CustomerVO();
			cvo.setVopenid(userInfo.getOpenId());
			cvo.setVsubscribeState(userInfo.getSubscribe());
			cvo.setVsubscribeTime(userInfo.getSubscribeTime());
			cvo.setVname(userInfo.getNickname());
			cvo.setVnickname(userInfo.getNickname());
			
			String vsex = "";
			if(userInfo.getSex() == 1){
				vsex = "男";
			}else if(userInfo.getSex() == 0){
				vsex = "女";
			}
			cvo.setVsex(vsex);
			cvo.setVcontry(userInfo.getCountry());
			cvo.setVprovince(userInfo.getProvince());
			cvo.setVcity(userInfo.getCity());
			cvo.setVlanguage(userInfo.getLanguage());
			cvo.setVhendimgurl(userInfo.getHeadImgUrl());
			cvo.setVgroup(userInfo.getGroupid());
			vcode = CommonUtils.getBillCode(IConstant.CODE_CUSTER);
			cvo.setVcustomerCode(vcode);
			cvo.setAgentId(agentId);
			cvo.setVserviceCode(serviceCode);
			
			saveOrUpdateCustomer(cvo);
		}else{
			vcode = findCustomerByWhere(" vopenid = '"+openId+"'").getVcustomerCode();
		}
		return vcode;
	}

	@Override
	public CustomerVO findCustomerByWhere(String condition) {
		String conditions = null;
		if(StringUtil.isNotEmpty(condition)){
			conditions = condition;
		}
		return findFirst(CustomerVO.class, conditions);
	}

}
