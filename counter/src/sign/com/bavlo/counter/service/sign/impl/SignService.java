package com.bavlo.counter.service.sign.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.sign.SignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.ISignService;

/**
 * @Title: ����Counter
 * @ClassName: SignService 
 * @Description: ǩ�յ�Service
 * @author liuzy
 * @date 2015-10-19 ����03:38:55
 */
@Service("signService")
public class SignService extends CommonService implements ISignService {

	@Override
	public Integer signSaveReID() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signSave() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void signUpdate() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SignVO findSingleById() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SignVO> findListByWh() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SignVO> findList() {
		return findAll(SignVO.class);
	}

	
}
