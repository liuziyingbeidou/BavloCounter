package com.bavlo.counter.service.custom.itf;

import java.util.List;

import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomCVO;
import com.bavlo.counter.model.custom.CustomDVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.useGem.UseGemVO;

/**
 * @Title: ����Counter
 * @ClassName: ICustomService
 * @Description: ��ʽ���ӿ�
 * @author shijf
 * @date 2015-10-20 ����04:12:56
 */
public interface ICustomService {

	/**
	 * @Description: �����ʽ��
	 * @param
	 * @return void
	 */
	public void saveCustom(CustomVO customVO);
	
	
	/** 
	 * @Description: �����ʽ��������ID 
	 * @param customVO
	 * @return Integer
	 */
	public Integer saveCustomRelID(CustomVO customVO);

	/**
	 * @Description: ɾ����ʽ��
	 * @param
	 * @return void
	 */
	public void deleteCustom(CustomVO customVO);

	/**
	 * @Description: ���¿�ʽ��
	 * @param
	 * @return void
	 */
	public void updateCustom(CustomVO customVO);
	
	/**
	 * @Description: ���¿�ʽ��
	 * @param
	 * @return void
	 */
	public void saveOrUpdateCustom(CustomVO customVO);

	/**
	 * @Description: ͨ��ID���ҿ�ʽ��
	 * @param @return
	 * @return CustomVO
	 */
	public CustomVO findCustomById(Integer id);

	/**
	 * @Description: ͨ���������ҿ�ʽ��
	 * @param @return
	 * @return List<CustomVO>
	 */
	public List<CustomVO> findCustomByWh(String content);

	/**
	 * @Description: ͨ���������ҿ�ʽ���б�
	 * @param @return
	 * @return List<CustomVO>
	 */
	public List<CustomVO> findCustomList(String wh);
	
	/**
	 * @Description: �����ӱ�
	 * @param @param listBVO
	 * @return void
	 */
	public void saveCustomB(Integer id, String json);
	
	/** 
	 * @Description: ������������������ɾ���ӱ�����
	 * @param @param mid type
	 * @return void
	*/
	public void deleteCustomB(Integer mid,String type);
	
	/**
	 * @Description: �����ӱ�
	 * @param @param listCVO
	 * @return void
	 */
	public void saveCustomC(List<CustomCVO> listCVO);
	
	/** 
	 * @Description: ������������ɾ���ӱ�����
	 * @param @param mid
	 * @return void
	 */
	public void deleteCustomC(Integer mid);
	
	/**
	 * @Description: �����ӱ�
	 * @param @param listDVO
	 * @return void
	 */
	public void saveCustomD(List<CustomDVO> listDVO);
	
	/** 
	 * @Description: ������������ɾ���ӱ�����
	 * @param @param mid
	 * @return void
	 */
	public void deleteCustomD(Integer mid);
	
	/**
	 * @Description: ��������������ѯ�ӱ�����
	 * @param @param id
	 * @param @return
	 * @return List<CustomBVO>
	 */
	public List<CustomBVO> findListCustomB(Integer id,String type);
	
	/**
	 * @Description: ��������������ѯ�ӱ�����
	 * @param @param id
	 * @param @return
	 * @return List<CustomCVO>
	 */
	public List<CustomCVO> findListCustomC(Integer id);
	
	/**
	 * @Description: ��������������ѯ�ӱ�����
	 * @param @param id
	 * @param @return
	 * @return List<CustomDVO>
	 */
	public List<CustomDVO> findListCustomD(Integer id);
	
	/**
	 * @Description: ���ݿ�ѡʯid��ѯ
	 * @param @param did
	 * @param @return
	 * @return CustomDVO
	 */
	public CustomDVO findCustomDVOBySql(Integer did);
	
	/**
	 * @Description: ��ʯ����д��ѡʯ
	 * @param @param did
	 * @param @param useGemVO
	 * @return void
	 */
	public void backCustomByUseGem(Integer did,UseGemVO useGemVO);
	
	
	/** 
	 * @Description: ���¶��Ƶ�ʸ��ͼ
	 * @param @param id
	 * @param @param vh
	 * @return void
	*/
	public void updateCustomVh(Integer id,String vh);
	
	
	/** 
	 * @Description: ���¶��Ƶ�cad
	 * @param @param id
	 * @param @param cad
	 * @return void
	 */
	public void updateCustomCad(Integer id,String cad);

}
