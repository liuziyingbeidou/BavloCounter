package com.bavlo.counter.service.custom.itf;

import java.util.List;

import com.bavlo.counter.model.custom.CustomVO;

/**
 * @Title: ����Counter
 * @ClassName: ICustomService
 * @Description: ���Ƶ��ӿ�
 * @author shijf
 * @date 2015-10-20 ����04:12:56
 */
public interface ICustomService {

	/**
	 * @Description: ���涨�Ƶ�
	 * @param
	 * @return void
	 */
	public void saveCustom(CustomVO customVO);

	/**
	 * @Description: ɾ�����Ƶ�
	 * @param
	 * @return void
	 */
	public void deleteCustom(CustomVO customVO);

	/**
	 * @Description: ���¶��Ƶ�
	 * @param
	 * @return void
	 */
	public void updateCustom(CustomVO customVO);
	
	/**
	 * @Description: ���¶��Ƶ�
	 * @param
	 * @return void
	 */
	public void saveOrUpdateCustom(CustomVO customVO);

	/**
	 * @Description: ͨ��ID���Ҷ��Ƶ�
	 * @param @return
	 * @return CustomVO
	 */
	public CustomVO findCustomById(Integer id);

	/**
	 * @Description: ͨ���������Ҷ��Ƶ�
	 * @param @return
	 * @return List<CustomVO>
	 */
	public List<CustomVO> findCustomByWh();

	/**
	 * @Description: ���Ҷ��Ƶ��б�
	 * @param @return
	 * @return List<CustomVO>
	 */
	public List<CustomVO> findCustomList();

}
