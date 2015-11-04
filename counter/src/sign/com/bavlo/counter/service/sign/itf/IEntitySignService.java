package com.bavlo.counter.service.sign.itf;

import java.util.List;

import com.bavlo.counter.model.sign.EntitySignBVO;
import com.bavlo.counter.model.sign.EntitySignVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: ISignService 
 * @Description: 实物签收单Service接口
 * @author liuzy
 * @date 2015-10-19 下午03:38:28
 */
public interface IEntitySignService {
	
	/**
	 * @Description: 保存
	 * @param @param gemSignVO
	 * @param @return
	 * @return Integer
	 */
	public Integer saveEntityRelID(EntitySignVO entitySignVO);
	/**
	 * @Description: 更新
	 * @param @param gemSignVO
	 * @return void
	 */
	public void updateEntity(EntitySignVO entitySignVO);

	/**
	 * @Description: 查询所有数据
	 * @param @return
	 * @return List<GemSignVO>
	 */
	public List<EntitySignVO> findListEntity();
	/**
	 * @Description: 根据id查询
	 * @param @param id
	 * @param @return
	 * @return GemSignVO
	 */
	public EntitySignVO findSigleEntity(Integer id);
	/**
	 * @Description: 保存子表
	 * @param @param listBVO
	 * @return void
	 */
	public void saveEntityB(List<EntitySignBVO> listBVO);
	/**
	 * @Description: 根据主表主键删除子表数据
	 * @param @param mid
	 * @return void
	 */
	public void deleteEntityB(Integer mid);
	/**
	 * @Description: 根据主表主键查询子表数据
	 * @param @param id
	 * @param @return
	 * @return List<GemSignBVO>
	 */
	public List<EntitySignBVO> findListEntityB(Integer id);
	/**
	 * @Description: 定义SQL
	 * @param @return
	 * @return List<GemSignVO>
	 */
	public List<EntitySignVO> findListEntityBySql(String wh);
}
