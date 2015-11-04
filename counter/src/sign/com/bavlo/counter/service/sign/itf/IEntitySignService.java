package com.bavlo.counter.service.sign.itf;

import java.util.List;

import com.bavlo.counter.model.sign.EntitySignBVO;
import com.bavlo.counter.model.sign.EntitySignVO;

/**
 * @Title: ����Counter
 * @ClassName: ISignService 
 * @Description: ʵ��ǩ�յ�Service�ӿ�
 * @author liuzy
 * @date 2015-10-19 ����03:38:28
 */
public interface IEntitySignService {
	
	/**
	 * @Description: ����
	 * @param @param gemSignVO
	 * @param @return
	 * @return Integer
	 */
	public Integer saveEntityRelID(EntitySignVO entitySignVO);
	/**
	 * @Description: ����
	 * @param @param gemSignVO
	 * @return void
	 */
	public void updateEntity(EntitySignVO entitySignVO);

	/**
	 * @Description: ��ѯ��������
	 * @param @return
	 * @return List<GemSignVO>
	 */
	public List<EntitySignVO> findListEntity();
	/**
	 * @Description: ����id��ѯ
	 * @param @param id
	 * @param @return
	 * @return GemSignVO
	 */
	public EntitySignVO findSigleEntity(Integer id);
	/**
	 * @Description: �����ӱ�
	 * @param @param listBVO
	 * @return void
	 */
	public void saveEntityB(List<EntitySignBVO> listBVO);
	/**
	 * @Description: ������������ɾ���ӱ�����
	 * @param @param mid
	 * @return void
	 */
	public void deleteEntityB(Integer mid);
	/**
	 * @Description: ��������������ѯ�ӱ�����
	 * @param @param id
	 * @param @return
	 * @return List<GemSignBVO>
	 */
	public List<EntitySignBVO> findListEntityB(Integer id);
	/**
	 * @Description: ����SQL
	 * @param @return
	 * @return List<GemSignVO>
	 */
	public List<EntitySignVO> findListEntityBySql(String wh);
}
