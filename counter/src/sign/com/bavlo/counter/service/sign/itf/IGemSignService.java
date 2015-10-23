package com.bavlo.counter.service.sign.itf;

import java.util.List;

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
	public Integer saveGemRelID(GemSignVO gemSignVO);
	/**
	 * @Description: ����
	 * @param @param gemSignVO
	 * @return void
	 */
	public void updateGem(GemSignVO gemSignVO);

	/**
	 * @Description: ��ѯ��������
	 * @param @return
	 * @return List<GemSignVO>
	 */
	public List<GemSignVO> findListGem();
	/**
	 * @Description: ����id��ѯ
	 * @param @param id
	 * @param @return
	 * @return GemSignVO
	 */
	public GemSignVO findSigleGem(Integer id);
}
