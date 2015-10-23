package com.bavlo.counter.service.sign.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IGemSignService;

/**
 * @Title: 宝珑Counter
 * @ClassName: GemSignService 
 * @Description: 宝石签收单实现
 * @author liuzy
 * @date 2015-10-21 上午11:40:49
 */
@Service("gemSignService")
public class GemSignService extends CommonService implements IGemSignService {

	@Override
	public Integer saveGemRelID(GemSignVO gemSignVO) {
		Integer id = null;
		
		try {
			id = saveReID(gemSignVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateGem(GemSignVO gemSignVO) {
		update(gemSignVO);
	}

	@Override
	public List<GemSignVO> findListGem() {
		
		return findAll(GemSignVO.class, "",null,"ts","desc");
	}

	@Override
	public GemSignVO findSigleGem(Integer id) {
		String wh = " id ="+id;
		return findFirst(GemSignVO.class, wh);
	}

}
