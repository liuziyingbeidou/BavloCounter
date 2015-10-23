package com.bavlo.counter.web.customer;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.customer.CustomerVO;
import com.bavlo.counter.service.customer.impl.CustomerService;
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
	private CustomerService customerService;

	/**
	 * @Description: �ͻ�����
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info() {

		return new ModelAndView(PATH_CUSTOMER + "customerEdit");
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
		return REDIRECT+"customer/info.do";
	}

	/**
	 * @Description: ��ȡ�ͻ��б�
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map) {

		List<CustomerVO> customer = customerService.findCustomerList();
		map.put("customer", customer);
		return new ModelAndView(PATH_CUSTOMER + "customerList");
	}

}
