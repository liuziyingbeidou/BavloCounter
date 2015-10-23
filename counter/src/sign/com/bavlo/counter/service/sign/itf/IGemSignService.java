package com.bavlo.counter.service.sign.itf;

import java.util.List;

import com.bavlo.counter.model.sign.GemSignVO;

/**
 * @Title: 宝珑Counter
 * @ClassName: IGemSignService 
 * @Description: 宝石签收单接口
 * @author liuzy
 * @date 2015-10-21 上午11:40:32
 */
public interface IGemSignService {

	/**
	 * @Description: 保存
	 * @param @param gemSignVO
	 * @param @return
	 * @return Integer
	 */
	public Integer saveGemRelID(GemSignVO gemSignVO);
	/**
	 * @Description: 更新
	 * @param @param gemSignVO
	 * @return void
	 */
	public void updateGem(GemSignVO gemSignVO);

	/**
	 * @Description: 查询所有数据
	 * @param @return
	 * @return List<GemSignVO>
	 */
	public List<GemSignVO> findListGem();
	/**
	 * @Description: 根据id查询
	 * @param @param id
	 * @param @return
	 * @return GemSignVO
	 */
	public GemSignVO findSigleGem(Integer id);
}
