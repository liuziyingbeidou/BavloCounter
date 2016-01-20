package com.bavlo.counter.service.relation.itf;

import java.util.List;

import com.bavlo.counter.model.relation.RelationVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: RelationService
 * @Description: 关联接口
 * @author shijf
 * @date 2016年1月11日 上午11:57:14
 */
public interface IRelationService {
	
	
	/** 
	 * @Description: 保存关联 
	 * @param @param relationVO
	 * @return void
	*/
	public void saveRelation(RelationVO relationVO);
	
	/** 
	 * @Description: 更新关联
	 * @param @param relationVO
	 * @return void
	*/
	public void updateRelation(RelationVO relationVO);
	
	/** 
	 * @Description: 删除关联
	 * @param @param relationVO
	 * @return void
	*/
	public void deleteRelation(RelationVO relationVO);
	
	/** 
	 * @Description: 保存或更新关联
	 * @param @param relationVO
	 * @param @return
	 * @return Integer
	*/
	public Integer saveOrUpdateRelation(RelationVO relationVO);
	
	/** 
	 * @Description: 通过ID查找关联 
	 * @param @param relationVO
	 * @param @return
	 * @return RelationVO
	*/
	public RelationVO findRelationById(Integer id);
	
	/** 
	 * @Description: 通过条件查找关联
	 * @param @param wh
	 * @param @return
	 * @return RelationVO
	*/
	public RelationVO findRelationByWh(String wh);

	/** 
	 * @Description: 根据接收者查找列表
	 * @param @param toUser
	 * @param @return
	 * @return List<RelationVO>
	*/
	public List<RelationVO> findRelationByToUser(String toUser);
	
	/** 
	 * @Description: 通过条件查找列表
	 * @param @param relationVO
	 * @param @return
	 * @return List<RelationVO>
	*/
	public List<RelationVO> findRelationList(String wh);

}
