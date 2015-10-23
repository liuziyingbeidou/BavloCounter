package com.bavlo.counter.service.sign.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IEntitySignService;

/**
 * @Title: 宝珑Counter
 * @ClassName: SignService 
 * @Description: 实物签收单Service实现
 * @author liuzy
 * @date 2015-10-19 下午03:38:55
 */
@Service("entitySignService")
public class EntitySignService extends CommonService implements IEntitySignService {

	@Override
	public Integer saveEntityRelID(EntitySignVO entitySignVO) {
		Integer id = null;
		
		try {
			id = saveReID(entitySignVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateEntity(EntitySignVO entitySignVO) {
		update(entitySignVO);
	}

	@Override
	public List<EntitySignVO> findListEntity() {
		
		return findAll(EntitySignVO.class, "",null,"ts","desc");
	}

	@Override
	public EntitySignVO findSigleEntity(Integer id) {
		String wh = " id ="+id;
		return findFirst(EntitySignVO.class, wh);
	}
	
}
