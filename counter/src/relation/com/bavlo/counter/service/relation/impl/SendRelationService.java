package com.bavlo.counter.service.relation.impl;

import java.util.List;

import com.bavlo.counter.model.relation.SendRelationVO;
import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.relation.itf.ISendRelationService;

public class SendRelationService extends CommonService implements ISendRelationService {

	@Override
	public void saveSendRelation(SendRelationVO sendRelationVO) {
	}

	@Override
	public void updateSendRelation(SendRelationVO sendRelationVO) {
	}

	@Override
	public void deleteSendRelation(SendRelationVO sendRelationVO) {
	}

	@Override
	public Integer saveOrUpdateSendRelation(SendRelationVO sendRelationVO) {
		Integer id = sendRelationVO.getId();
		try {
			if(id == null){
				save(sendRelationVO);
			} else {
				update(sendRelationVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public SendRelationVO findSendRelationById(Integer id) {
		String wh = " id ="+id;
		return findFirst(SendRelationVO.class, wh);
	}

	@Override
	public List<SendRelationVO> findSendRelationList(String wh) {
		return null;
	}

}
