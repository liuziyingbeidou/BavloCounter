package com.bavlo.counter.service.custom.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.impl.CommonService;


/** 
 * @Title: ±¦ççCounter
 * @ClassName: CustomService 
 * @Description: ¿Í»§service
 * @author shijf
 * @date 2015-10-20 ÏÂÎç04:12:30  
 */
@Service("CustomService")
public class CustomService extends CommonService implements ICustomService {

	@Override
	public void saveCustom(CustomVO customVO) {

	}

	@Override
	public void deleteCustom(CustomVO customVO) {
		
	}

	@Override
	public void updateCustom(CustomVO customVO) {
		
	}
	
	@Override
	public void saveOrUpdateCustom(CustomVO customVO) {
		try {
			saveOrUpdate(customVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CustomVO findCustomById(Integer id) {
		String wh = " id ="+id;
		return findFirst(CustomVO.class, wh);
	}

	@Override
	public List<CustomVO> findCustomByWh() {
		return null;
	}

	@Override
	public List<CustomVO> findCustomList() {
	
		return findAll(CustomVO.class, "",null,"id","desc");
	}

}
