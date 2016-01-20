package com.bavlo.counter.service.relation.itf;

import java.util.List;

import com.bavlo.counter.model.relation.RelationVO;

/**
 * @Title: ����Counter
 * @ClassName: RelationService
 * @Description: �����ӿ�
 * @author shijf
 * @date 2016��1��11�� ����11:57:14
 */
public interface IRelationService {
	
	
	/** 
	 * @Description: ������� 
	 * @param @param relationVO
	 * @return void
	*/
	public void saveRelation(RelationVO relationVO);
	
	/** 
	 * @Description: ���¹���
	 * @param @param relationVO
	 * @return void
	*/
	public void updateRelation(RelationVO relationVO);
	
	/** 
	 * @Description: ɾ������
	 * @param @param relationVO
	 * @return void
	*/
	public void deleteRelation(RelationVO relationVO);
	
	/** 
	 * @Description: �������¹���
	 * @param @param relationVO
	 * @param @return
	 * @return Integer
	*/
	public Integer saveOrUpdateRelation(RelationVO relationVO);
	
	/** 
	 * @Description: ͨ��ID���ҹ��� 
	 * @param @param relationVO
	 * @param @return
	 * @return RelationVO
	*/
	public RelationVO findRelationById(Integer id);
	
	/** 
	 * @Description: ͨ���������ҹ���
	 * @param @param wh
	 * @param @return
	 * @return RelationVO
	*/
	public RelationVO findRelationByWh(String wh);

	/** 
	 * @Description: ���ݽ����߲����б�
	 * @param @param toUser
	 * @param @return
	 * @return List<RelationVO>
	*/
	public List<RelationVO> findRelationByToUser(String toUser);
	
	/** 
	 * @Description: ͨ�����������б�
	 * @param @param relationVO
	 * @param @return
	 * @return List<RelationVO>
	*/
	public List<RelationVO> findRelationList(String wh);

}
