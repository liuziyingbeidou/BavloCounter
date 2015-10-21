package com.bavlo.counter.service.sign.itf;

import com.bavlo.counter.model.sign.EntitySignVO;

/**
 * @Title: ����Counter
 * @ClassName: ISignService 
 * @Description: ʵ��ǩ�յ�Service�ӿ�
 * @author liuzy
 * @date 2015-10-19 ����03:38:28
 */
public interface IEntitySignService {
	
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
	public void signSave(EntitySignVO entitySignVO);
	
}
