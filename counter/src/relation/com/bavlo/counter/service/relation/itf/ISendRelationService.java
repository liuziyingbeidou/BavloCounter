package com.bavlo.counter.service.relation.itf;

import java.util.List;

import com.bavlo.counter.model.relation.SendRelationVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: SendRelationService
 * @Description: 发送关系接口
 * @author shijf
 * @date 2016年1月11日 上午11:57:14
 */
public interface ISendRelationService {
	
	
	/** 
	 * @Description: 保存关系 
	 * @param @param sendRelationVO
	 * @return void
	*/
	public void saveSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: 更新关系
	 * @param @param sendRelationVO
	 * @return void
	*/
	public void updateSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: 删除关系
	 * @param @param sendRelationVO
	 * @return void
	*/
	public void deleteSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: 保存或更新关系
	 * @param @param sendRelationVO
	 * @param @return
	 * @return Integer
	*/
	public Integer saveOrUpdateSendRelation(SendRelationVO sendRelationVO);
	
	/** 
	 * @Description: 通过ID查找关系 
	 * @param @param sendRelationVO
	 * @param @return
	 * @return SendRelationVO
	*/
	public SendRelationVO findSendRelationById(Integer id);
	
	/** 
	 * @Description: 通过条件查找关系列表
	 * @param @param sendRelationVO
	 * @param @return
	 * @return List<SendRelationVO>
	*/
	public List<SendRelationVO> findSendRelationList(String wh);

}
