package com.bavlo.counter.service.sign.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.GemSignBVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IGemSignService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.JsonUtils;
import com.bavlo.counter.utils.ObjectToJSON;
import com.bavlo.counter.utils.StringUtil;

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
	
	public List<GemSignVO> findListGemBySql(String wh){
		
		StringBuilder sql = new StringBuilder();
		sql.append("select ");
		sql.append(" a.id,a.vnumber,b.vname as vdef1,b.vpath vdef2");
		sql.append(" from blct_gemsign a");
		sql.append(" left join blct_gemsign_b b");
		sql.append(" on a.id=b.gemsign_id");
		sql.append(" where ifnull(a.dr,0)=0 and b.biscover='"+IConstant.YES+"'");
		if(StringUtil.isNotEmpty(wh)){
			sql.append(" and" +wh);
		}
		
		sql.append(" order by a.id desc");
		
		Integer count = getCountBySQL(sql.toString());
		List<GemSignVO> list = (List<GemSignVO>)findListBySQL(sql.toString(), null, 0, count);
		List<GemSignVO> list_ = new ArrayList<GemSignVO>();
		if(list != null){
			String jsonstr = ObjectToJSON.writeListJSON(list);
			JSONArray jsonArr = JSONArray.fromObject(jsonstr);
			int size = jsonArr.size();
			for (int i = 0; i < size; i++) {
				GemSignVO dto = new GemSignVO();
				Object[] arry = jsonArr.getJSONArray(i).toArray();
				dto.setId(CommonUtils.isNull(arry[0]) ? null :Integer.valueOf(arry[0]+""));
				dto.setVnumber(CommonUtils.isNull(arry[1]) ? null :arry[1]+"");
				dto.setVdef1(CommonUtils.isNull(arry[2]) ? null :arry[2]+"");
				dto.setVdef2(CommonUtils.isNull(arry[3]) ? null :arry[3]+"");
				dto.setVdef3(CommonUtils.getMinPicName(arry[2]+""));
				list_.add(dto);
			}
		}
		
		return list_;
	}

	@Override
	public GemSignVO findSigleGem(Integer id) {
		String wh = " id ="+id;
		GemSignVO vo = findFirst(GemSignVO.class, wh);
		String bwh = " gemsignId="+id +" and biscover='Y'";
		GemSignBVO bvo = findFirst(GemSignBVO.class, bwh);
		if(bvo != null){
			vo.setFILE_0(bvo.getVpath()+"/min/"+CommonUtils.getMinPicName(bvo.getVname()));//封面
		}
		
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
