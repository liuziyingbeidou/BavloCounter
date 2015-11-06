package com.bavlo.counter.service.useGem.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.useGem.itf.IUseGemService;


/** 
 * @Title: 宝珑Counter
 * @ClassName: UseGemService 
 * @Description: 配石单实现
 * @author shijf
 * @date 2015-10-24 下午06:15:05  
 */
@Service("UseGemService")
public class UseGemService extends CommonService implements IUseGemService {

	@Override
	public void saveUseGem(UseGemVO useGemVO) {

	}

	@Override
	public void deleteUseGem(UseGemVO useGemVO) {
		
	}

	@Override
	public void updateUseGem(UseGemVO useGemVO) {
		
	}
	
	@Override
	public void saveOrUpdateUseGem(UseGemVO useGemVO) {
		try {
			saveOrUpdate(useGemVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UseGemVO findUseGemById(Integer id) {
		String wh = " id ="+id;
		return findFirst(UseGemVO.class, wh);
	}

	@Override
	public List<UseGemVO> findUseGemByWh() {
		return null;
	}

	@Override
	public List<UseGemVO> findUseGemList(String wh) {
	
		return findAll(UseGemVO.class, wh,null,"id","desc");
	}

}
