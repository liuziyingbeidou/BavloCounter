package com.bavlo.counter.service.sign.impl;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IEntitySignService;

/**
 * @Title: ����Counter
 * @ClassName: SignService 
 * @Description: ʵ��ǩ�յ�Serviceʵ��
 * @author liuzy
 * @date 2015-10-19 ����03:38:55
 */
@Service("entitySignService")
public class EntitySignService extends CommonService implements IEntitySignService {

	@Override
	public Integer signSaveReID() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signSave(EntitySignVO entitySignVO) {
		try {
			/**
			 * 1������ǰ����
			 */
			
			save(entitySignVO);
			
			/**
			 * 2���������
			 */
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
