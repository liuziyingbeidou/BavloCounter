package com.bavlo.counter.web.custom;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: CustomController
 * @Description: ������
 * @author shijf
 * @date 2015-10-20 ����04:00:41
 */
@RequestMapping("custom")
@Controller
public class CustomController extends BaseController implements IConstant {

	@Resource
	private ICustomService customService;

	/**
	 * @Description: �ͻ�����
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		List<CustomVO> customList = customService.findCustomList();
		map.put("customList", customList);

		CustomVO customDetail = customService.findCustomById(id);
		map.put("customDetail", customDetail);
		return new ModelAndView(PATH_CUSTOM + "customEdit");
	}

	/**
	 * @Description: �������¿ͻ���Ϣ
	 * @param @param customVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(CustomVO customVO) {

		customService.saveOrUpdateCustom(customVO);
		return REDIRECT + "custom/info.do";
	}

	/**
	 * @Description: ��ȡ�ͻ��б�
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("getList")
	public ModelAndView getList(Map<String, Object> map) {

		List<CustomVO> custom = customService.findCustomList();
		map.put("custom", custom);
		return new ModelAndView(PATH_CUSTOM + "customList");
	}

}
