package com.bavlo.counter.service.sign.itf;

import com.bavlo.counter.model.sign.GemSignVO;

/**
 * @Title: ����Counter
 * @ClassName: IGemSignService 
 * @Description: ��ʯǩ�յ��ӿ�
 * @author liuzy
 * @date 2015-10-21 ����11:40:32
 */
public interface IGemSignService {

	/**
	 * @Description: ����
	 * @param @param gemSignVO
	 * @param @return
	 * @return Integer
	 */
	public Integer saveRelId(GemSignVO gemSignVO);

}
