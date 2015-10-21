package com.bavlo.counter.service.sign.itf;

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
	public Integer saveRelId(GemSignVO gemSignVO);

}
