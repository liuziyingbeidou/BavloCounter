package com.bavlo.counter.service.sign.itf;

import java.util.List;

import com.bavlo.counter.model.sign.SignVO;

/**
 * @Title: ����Counter
 * @ClassName: ISignService 
 * @Description: ǩ�յ�Service�ӿ�
 * @author liuzy
 * @date 2015-10-19 ����03:38:28
 */
public interface ISignService {
	
	/**
	 * @Description: ǩ�յ�����,��������
	 * @param @return
	 * @return Integer
	 */
	public Integer signSaveReID();
	
	/**
	 * @Description: ǩ�յ�����
	 * @param @return
	 * @return Integer
	 */
	public void signSave(SignVO signVO);
	
	/**
	 * @Description: ����
	 * @param 
	 * @return void
	 */
	public void signUpdate();
	
	/**
	 * @Description: ͨ��ID�������ݣ�����VO
	 * @param @return
	 * @return SignVO
	 */
	public SignVO findSingleById();
	
	/**
	 * @Description: ͨ����������
	 * @param @return
	 * @return List<SignVO>
	 */
	public List<SignVO> findListByWh();
	
	/**
	 * @Description: ����ȫ��
	 * @param @return
	 * @return List<SignVO>
	 */
	public List<SignVO> findList();
}
