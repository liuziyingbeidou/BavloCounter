package com.bavlo.counter.service.relation.itf;

import java.util.List;

import com.bavlo.counter.model.relation.SendRelationVO;

/**
 * @Title: ����Counter
 * @ClassName: SendRelationService
 * @Description: ���͹�ϵ�ӿ�
 * @author shijf
 * @date 2016��1��11�� ����11:57:14
 */
public interface ISendRelationService {
	
	
	/** 
	 * @Description: �����ϵ 
	 * @param @param sendRelationVO
	 * @return void
	*/
	public void saveSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: ���¹�ϵ
	 * @param @param sendRelationVO
	 * @return void
	*/
	public void updateSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: ɾ����ϵ
	 * @param @param sendRelationVO
	 * @return void
	*/
	public void deleteSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: �������¹�ϵ
	 * @param @param sendRelationVO
	 * @param @return
	 * @return Integer
	*/
	public Integer saveOrUpdateSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: ͨ��ID���ҹ�ϵ 
	 * @param @param sendRelationVO
	 * @param @return
	 * @return SendRelationVO
	*/
	public SendRelationVO findSendRelationById(Integer id);
	
	/** 
	 * @Description: ͨ���������ҹ�ϵ�б�
	 * @param @param sendRelationVO
	 * @param @return
	 * @return List<SendRelationVO>
	*/
	public List<SendRelationVO> findSendRelationList(String wh);

}
