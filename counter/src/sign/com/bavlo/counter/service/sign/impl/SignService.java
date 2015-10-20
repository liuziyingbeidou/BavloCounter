package com.bavlo.counter.service.sign.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bavlo.counter.model.sign.SignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.ISignService;

/**
 * @Title: 宝珑Counter
 * @ClassName: SignService 
 * @Description: 签收单Service
 * @author liuzy
 * @date 2015-10-19 下午03:38:55
 */
@Service("signService")
public class SignService extends CommonService implements ISignService {

	@Override
	public Integer signSaveReID() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signSave(SignVO signVO) {
		try {
			/**
			 * 1、保存前处理
			 */
			
			save(signVO);
			
			/**
			 * 2、保存后处理
			 */
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
