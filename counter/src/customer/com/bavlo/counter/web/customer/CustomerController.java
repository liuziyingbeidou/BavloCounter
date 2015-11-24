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
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.service.customer.itf.ICustomerService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;

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
	@RequestMapping("info")
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
	@RequestMapping("infoJson")
	public void infoJson(Map<String, Object> map, Integer id) {

		CustomerVO customerDetail = customerService.findCustomerById(id);
		renderJson(customerDetail);
	}

	/**
	 * @Description: �������¿ͻ���Ϣ
	 * @param @param customerVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(CustomerVO customerVO) {

		customerService.saveOrUpdateCustomer(customerVO);
		return REDIRECT + "customer/info.do";
	}

	/**
	 * @Description: ��ȡ�ͻ��б�
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="list")
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
			wh = " vname like '%"+content+"%' or vphoneCode like '%"+content+"%'";
		}
		List<CustomerVO> customerList = customerService.findCustomerList(wh);
		renderJson(customerList);
	}

}
