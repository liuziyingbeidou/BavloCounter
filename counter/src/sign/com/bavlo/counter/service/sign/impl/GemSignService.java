package com.bavlo.counter.service.sign.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.sign.GemSignBVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IGemSignService;
import com.bavlo.counter.utils.CommonUtils;

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
		GemSignVO vo = findFirst(GemSignVO.class, wh);
		String bwh = " gemsignId="+id +" and biscover='Y'";
		GemSignBVO bvo = findFirst(GemSignBVO.class, bwh);
		vo.setFILE_0(bvo.getVpath()+"/min/"+CommonUtils.getMinPicName(bvo.getVname()));//封面
		return vo;
	}

	@Override
	public void saveGemB(List<GemSignBVO> listBVO) {
		try {
			save(listBVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteGemB(Integer mid) {
		List<GemSignBVO>  list = findListGemB(mid);
		if(list != null){
			for (GemSignBVO gemSignBVO : list) {
				delete(gemSignBVO);
			}
		}
		
	}

	@Override
	public List<GemSignBVO> findListGemB(Integer mid) {
		List<GemSignBVO>  list = findAll(GemSignBVO.class, " gemsignId="+mid);
		return list;
	}

}
