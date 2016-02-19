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
 * @Title: ����Counter
 * @ClassName: CustomerController
 * @Description: �ͻ�������
 * @author shijf
 * @date 2015-10-20 ����04:00:41
 */
@RequestMapping("customer")
@Controller
public class CustomerController extends BaseController implements IConstant {

	@Resource
	private ICustomerService customerService;

	/**
	 * @Description: �ͻ�����
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("/info.do")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		CustomerVO customerDetail = customerService.findCustomerById(id);
		if(id != null){
			map.put("pageOrderType", IConstant.PAGE_TYPE_EDIT);
		}else{
			//���
			map.put("number", CommonUtils.getBillCode(IConstant.CODE_CUSTER));
			map.put("pageOrderType", IConstant.PAGE_TYPE_ADD);
		}
		map.put("customerDetail", customerDetail);
		return new ModelAndView(PATH_CUSTOMER + "customerEdit");
	}
	
	/**
	 * @Description: �ͻ�����
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("/infoJson.do")
	public void infoJson(Map<String, Object> map, Integer id) {

		CustomerVO customerDetail = customerService.findCustomerById(id);
		renderJson(customerDetail);
	}

	/**
	 * @Description: ���ֻ����Ƿ���ע��
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
	 * @Description: �������¿ͻ���Ϣ
	 * @param @param customerVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public void saveOrUpdate(CustomerVO customerVO) {
		if(StringUtil.isEmpty(customerVO.getVserviceCode())){
			//��΢��ɨ�����
			Object lgObj = request.getSession().getAttribute("loginInfo");
			if(lgObj != null){
				//��ǰ��¼����Ϣ
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
	 * @Description: ��ȡ�ͻ��б�
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
	 * @Description: ��ȡ�ͻ��б�JSON
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
		/**��ɫȨ�޿���--��ʼ**/
		wh = getAuthSQL(wh,"vserviceCode","to_userids");
		/*Object lgObj = request.getSession().getAttribute("loginInfo");
		if(lgObj != null){
			//��ǰ��¼����Ϣ
			LoginVO lgInfo = (LoginVO)lgObj;
			List<String> roleList = lgInfo.getRole();
			if(roleList != null){
				//��PM
				if(!roleList.contains(IConstant.ROLE_PM)){
					//��ǰ��¼���ƹ����µĿͻ�
					wh += " and vserviceCode ='"+lgInfo.getKfcode()+"'";
				}
			}else{
				wh = " 1=2";
			}
		}else{
			wh = " 1=2";
		}*/
		/**��ɫȨ�޿���--����**/
		List<CustomerVO> customerList = customerService.findCustomerList(wh);
		renderJson(customerList);
	}

}
