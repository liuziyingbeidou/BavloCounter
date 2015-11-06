package com.bavlo.counter.web.useGem;

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
import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.useGem.itf.IUseGemService;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: ����Counter
 * @ClassName: UseGemController
 * @Description: ��ʯ��������
 * @author shijf
 * @date 2015-10-23 ����11:49:18
 */
@RequestMapping("useGem")
@Controller
public class UseGemController extends BaseController implements IConstant {
	
	@Resource
	private IUseGemService useGemService;

	/**
	 * @Description: ��ʯ������
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("info")
	public ModelAndView info(Map<String, Object> map, Integer id) {

		UseGemVO useGemDetail = useGemService.findUseGemById(id);
		
		map.put("useGemDetail", useGemDetail);
		return new ModelAndView(PATH_USE_GEM + "useGemEdit");
	}

	/**
	 * @Description: ����������ʯ����Ϣ
	 * @param @param useGemVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("saveOrUpdate")
	public String saveOrUpdate(UseGemVO useGemVO) {

		useGemService.saveOrUpdateUseGem(useGemVO);
		return REDIRECT + "useGem/info.do";
	}

	/**
	 * @Description: ��ȡ��ʯ���б�
	 * @param @param map
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping("list")
	public ModelAndView list(Map<String, Object> map) {

		return new ModelAndView(PATH_USE_GEM + "useGemList");
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
			wh = " vtype like '%"+content+"%' or vshape like '%"+content+"%'";
		}
		List<UseGemVO> useGemList = useGemService.findUseGemList(wh);
		renderJson(useGemList);
	}

}
