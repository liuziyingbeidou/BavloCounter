package com.bavlo.counter.service.gem.itf;

import java.util.List;

import com.bavlo.counter.model.gem.UseGemVO;

/** 
 * @Title: ����Counter
 * @ClassName: IUseGemService 
 * @Description: ��ʯ���ӿ� 
 * @author shijf
 * @date 2015-10-24 ����06:13:06  
 */
public interface IUseGemService {

	/**
	 * @Description: ������ʯ��
	 * @param
	 * @return void
	 */
	public void saveUseGem(UseGemVO useGemVO);

	/**
	 * @Description: ɾ����ʯ��
	 * @param
	 * @return void
	 */
	public void deleteUseGem(UseGemVO useGemVO);

	/**
	 * @Description: ������ʯ��
	 * @param
	 * @return void
	 */
	public void updateUseGem(UseGemVO useGemVO);
	
	/**
	 * @Description: ������ʯ��
	 * @param
	 * @return void
	 */
	public void saveOrUpdateUseGem(UseGemVO useGemVO);

	/**
	 * @Description: ͨ��ID������ʯ��
	 * @param @return
	 * @return UseGemVO
	 */
	public UseGemVO findUseGemById(Integer id);

	/**
	 * @Description: ͨ������������ʯ��
	 * @param @return
	 * @return List<UseGemVO>
	 */
	public List<UseGemVO> findUseGemByWh();

	/**
	 * @Description: ������ʯ���б�
	 * @param @return
	 * @return List<UseGemVO>
	 */
	public List<UseGemVO> findUseGemList();
	
}
