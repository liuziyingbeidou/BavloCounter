package com.bavlo.counter.service.custom.itf;

import java.util.List;

import com.bavlo.counter.model.custom.CustomVO;

/**
 * @Title: ����Counter
 * @ClassName: ICustomService
 * @Description: �ͻ��ӿ�
 * @author shijf
 * @date 2015-10-20 ����04:12:56
 */
public interface ICustomService {

	/**
	 * @Description: ����ͻ�
	 * @param
	 * @return void
	 */
	public void saveCustom(CustomVO customVO);

	/**
	 * @Description: ɾ���ͻ�
	 * @param
	 * @return void
	 */
	public void deleteCustom(CustomVO customVO);

	/**
	 * @Description: ���¿ͻ�
	 * @param
	 * @return void
	 */
	public void updateCustom(CustomVO customVO);
	
	/**
	 * @Description: ���¿ͻ�
	 * @param
	 * @return void
	 */
	public void saveOrUpdateCustom(CustomVO customVO);

	/**
	 * @Description: ͨ��ID���ҿͻ�
	 * @param @return
	 * @return CustomVO
	 */
	public CustomVO findCustomById(Integer id);

	/**
	 * @Description: ͨ���������ҿͻ�
	 * @param @return
	 * @return List<CustomVO>
	 */
	public List<CustomVO> findCustomByWh();

	/**
	 * @Description: ���ҿͻ��б�
	 * @param @return
	 * @return List<CustomVO>
	 */
	public List<CustomVO> findCustomList();

}
