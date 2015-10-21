package com.bavlo.counter.service.sign.impl;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IGemSignService;

/**
 * @Title: ����Counter
 * @ClassName: GemSignService 
 * @Description: ��ʯǩ�յ�ʵ��
 * @author liuzy
 * @date 2015-10-21 ����11:40:49
 */
@Service("gemSignService")
public class GemSignService extends CommonService implements IGemSignService {

	@Override
	public Integer saveRelId(GemSignVO gemSignVO) {
		Integer id = null;
		try {
			id = saveReID(gemSignVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

}
