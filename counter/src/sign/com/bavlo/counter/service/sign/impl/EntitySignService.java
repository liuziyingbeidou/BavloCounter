package com.bavlo.counter.service.sign.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.sign.EntitySignBVO;
import com.bavlo.counter.model.sign.EntitySignVO;
import com.bavlo.counter.model.sign.GemSignBVO;
import com.bavlo.counter.model.sign.GemSignVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.sign.itf.IEntitySignService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.ObjectToJSON;
import com.bavlo.counter.utils.StringUtil;

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
		EntitySignVO vo = findFirst(EntitySignVO.class, wh);
		String bwh = " entitysignId="+id +" and biscover='Y'";
		EntitySignBVO bvo = findFirst(EntitySignBVO.class, bwh);
		if(bvo != null){
			vo.setFILE_0(bvo.getVpath()+"/min/"+CommonUtils.getMinPicName(bvo.getVname()));//封面
		}
		return vo;
	}

	@Override
	public void saveEntityB(List<EntitySignBVO> listBVO) {
		try {
			save(listBVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteEntityB(Integer mid) {
		List<EntitySignBVO>  list = findListEntityB(mid);
		if(list != null){
			for (EntitySignBVO entitySignBVO : list) {
				delete(entitySignBVO);
			}
		}
	}

	@Override
	public List<EntitySignBVO> findListEntityB(Integer mid) {
		List<EntitySignBVO>  list = findAll(EntitySignBVO.class, " entitysignId="+mid);
		return list;
	}

	@Override
	public List<EntitySignVO> findListEntityBySql(String wh) {
		StringBuilder sql = new StringBuilder();
		sql.append("select ");
		sql.append(" a.id,a.vnumber,b.vname as vdef1,b.vpath vdef2");
		sql.append(" from blct_entitysign a");
		sql.append(" left join blct_entitysign_b b");
		sql.append(" on a.id=b.entitysign_id");
		sql.append(" where ifnull(a.dr,0)=0 and b.biscover='"+IConstant.YES+"'");
		if(StringUtil.isNotEmpty(wh)){
			sql.append(" and" +wh);
		}
		
		Integer count = getCountBySQL(sql.toString());
		List<EntitySignVO> list = (List<EntitySignVO>)findListBySQL(sql.toString(), null, 0, count);
		List<EntitySignVO> list_ = new ArrayList<EntitySignVO>();
		if(list != null){
			String jsonstr = ObjectToJSON.writeListJSON(list);
			JSONArray jsonArr = JSONArray.fromObject(jsonstr);
			int size = jsonArr.size();
			for (int i = 0; i < size; i++) {
				EntitySignVO dto = new EntitySignVO();
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
	
}
