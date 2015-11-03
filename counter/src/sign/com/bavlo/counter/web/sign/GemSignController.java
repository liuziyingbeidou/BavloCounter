package com.bavlo.counter.web.sign;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.GemSignBVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.sign.itf.IGemSignService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.StringUtil;
import com.bavlo.counter.web.BaseController;

/**
 * @Title: 宝珑Counter
 * @ClassName: GemSignController 
 * @Description: 宝石签收单
 * @author liuzy
 * @date 2015-10-21 上午11:42:17
 */
@Controller
@RequestMapping(value="/gem-sign")
public class GemSignController extends BaseController {
	
	@Resource
	private IGemSignService gemSignService;
	
	@RequestMapping(value="/list")
	public ModelAndView gemList(){
		
		List<GemSignVO> gemList = gemSignService.findListGem();
		
		ModelAndView model = new ModelAndView(IConstant.PATH_GEM + IConstant.GEM_SIGN_LIST);
		model.addObject("gemList", gemList);
		return model;
	}
	
	/**
	 * @Description: 重定向到新增界面
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/add")
	public ModelAndView gemAdd(){
		
		ModelAndView model = new ModelAndView(IConstant.PATH_GEM + IConstant.GEM_SIGN_EDIT);
		model.addObject("pageGemType", IConstant.PAGE_TYPE_ADD);
		//编号
		model.addObject("number", CommonUtils.getBillCode(IConstant.CODE_GEMSIGN));
		return model;
	}
	
	/**
	 * @Description: 宝石签收单保存
	 * @param @param gemSignVO
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public void gemSave(HttpServletRequest request,GemSignVO gemSignVO){
		System.out.println("正在保存....");
		
		String bvo = request.getParameter("bvo");
		
		Integer id = gemSignVO.getId();
		if(id == null){
			id = gemSignService.saveGemRelID(gemSignVO);
		}else{
			gemSignService.updateGem(gemSignVO);
		}
		
		//子表保存
		ArrayList<GemSignBVO> listbvo = new ArrayList<GemSignBVO>();
		JSONObject jsonBVO = JSONObject.fromObject(bvo);
		String filemodel = jsonBVO.get("filemodel") + "";
		String FILE_0 = jsonBVO.get("FILE_0") + "";
		if(StringUtil.isNotEmpty(FILE_0)){
			GemSignBVO bvo_0 = new GemSignBVO();
			bvo_0.setGemsignId(id);
			bvo_0.setVname(FILE_0);
			bvo_0.setVpath(filemodel);
			bvo_0.setBiscover(IConstant.YES);
			listbvo.add(bvo_0);
		}
		String FILE_1 = jsonBVO.get("FILE_1") + "";
		if(StringUtil.isNotEmpty(FILE_1)){
			GemSignBVO bvo_1 = new GemSignBVO();
			bvo_1.setGemsignId(id);
			bvo_1.setVname(FILE_1);
			bvo_1.setVpath(filemodel);
			listbvo.add(bvo_1);
		}
		String FILE_2 = jsonBVO.get("FILE_2") + "";
		if(StringUtil.isNotEmpty(FILE_2)){
			GemSignBVO bvo_2 = new GemSignBVO();
			bvo_2.setGemsignId(id);
			bvo_2.setVname(FILE_2);
			bvo_2.setVpath(filemodel);
			listbvo.add(bvo_2);
		}
		String FILE_3 = jsonBVO.get("FILE_3") + "";
		if(StringUtil.isNotEmpty(FILE_3)){
			GemSignBVO bvo_3 = new GemSignBVO();
			bvo_3.setGemsignId(id);
			bvo_3.setVname(FILE_3);
			bvo_3.setVpath(filemodel);
			listbvo.add(bvo_3);
		}
		String FILE_4 = jsonBVO.get("FILE_4") + "";
		if(StringUtil.isNotEmpty(FILE_4)){
			GemSignBVO bvo_4 = new GemSignBVO();
			bvo_4.setGemsignId(id);
			bvo_4.setVname(FILE_4);
			bvo_4.setVpath(filemodel);
			listbvo.add(bvo_4);
		}
		String FILE_5 = jsonBVO.get("FILE_5") + "";
		if(StringUtil.isNotEmpty(FILE_5)){
			GemSignBVO bvo_5 = new GemSignBVO();
			bvo_5.setGemsignId(id);
			bvo_5.setVname(FILE_5);
			bvo_5.setVpath(filemodel);
			listbvo.add(bvo_5);
		}
		String FILE_6 = jsonBVO.get("FILE_6") + "";
		if(StringUtil.isNotEmpty(FILE_6)){
			GemSignBVO bvo_6 = new GemSignBVO();
			bvo_6.setGemsignId(id);
			bvo_6.setVname(FILE_6);
			bvo_6.setVpath(filemodel);
			listbvo.add(bvo_6);
		}
		String FILE_7 = jsonBVO.get("FILE_7") + "";
		if(StringUtil.isNotEmpty(FILE_7)){
			GemSignBVO bvo_7 = new GemSignBVO();
			bvo_7.setGemsignId(id);
			bvo_7.setVname(FILE_7);
			bvo_7.setVpath(filemodel);
			listbvo.add(bvo_7);
		}
		String FILE_8 = jsonBVO.get("FILE_8") + "";
		if(StringUtil.isNotEmpty(FILE_8)){
			GemSignBVO bvo_8 = new GemSignBVO();
			bvo_8.setGemsignId(id);
			bvo_8.setVname(FILE_8);
			bvo_8.setVpath(filemodel);
			listbvo.add(bvo_8);
		}
		
		gemSignService.deleteGemB(id);
		gemSignService.saveGemB(listbvo);
		
		renderJson("{\"id\":"+id+"}");
	}
	
	@RequestMapping(value="/view")
	public ModelAndView gemView(@RequestParam(value="id",required=false) Integer id){
		
		GemSignVO gemSignVO = gemSignService.findSigleGem(id);
		
		ModelAndView model = new ModelAndView(IConstant.PATH_GEM + IConstant.GEM_SIGN_EDIT);
		model.addObject("pageGemType", IConstant.PAGE_TYPE_EDIT);
		model.addObject("gemvo",gemSignVO);
		return model;
	}
}
