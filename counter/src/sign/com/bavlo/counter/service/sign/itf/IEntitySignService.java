package com.bavlo.counter.service.sign.itf;

import java.util.List;

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
	
}
