package com.bavlo.counter.service.relation.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.relation.RelationVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.relation.itf.IRelationService;
import com.bavlo.counter.utils.DateUtil;


/** 
 * @Title: 宝珑Counter
 * @ClassName: RelationService 
 * @Description: 关联service
 * @author shijf
 * @date 2016年1月20日 下午3:48:15  
 */
@Service("RelationService")
public class RelationService extends CommonService implements IRelationService {

	@Override
	public void saveRelation(RelationVO relationVO) {
		try {
			save(relationVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRelation(RelationVO relationVO) {
		update(relationVO);
	}

	@Override
	public void deleteRelation(RelationVO relationVO) {
	}

	@Override
	public Integer saveOrUpdateRelation(RelationVO relationVO) {
		String fromUser = relationVO.getVfromUser();
		String toUser = relationVO.getVtoUser();
		String url = relationVO.getVurl();
		Integer id = null;
		if(fromUser != null && toUser != null && url != null){
			//查找记录
			String wh = " vfromUser ="+"'"+fromUser+"'" + " and vtoUser ="+"'"+toUser+"'" + " and vurl ="+"'"+url+"'";
			RelationVO vo = findFirst(RelationVO.class, wh);
			Timestamp ts = DateUtil.getStrTimestamp(DateUtil.getCurDateTime());
			if(vo != null){
				id = vo.getId();
				//更新时间戳
				vo.setTs(ts);
				update(vo);
			} else {
				id = relationVO.getId();
				relationVO.setTs(ts);
				try {
					save(relationVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return id;
	}

	@Override
	public RelationVO findRelationById(Integer id) {
		String wh = " id ="+id;
		return findFirst(RelationVO.class, wh);
	}
	
	@Override
	public RelationVO findRelationByWh(String wh) {
		return findFirst(RelationVO.class, wh);
	}
	
	@Override
	public List<RelationVO> findRelationByToUser(String toUser) {
		String wh = " vtoUser ="+"'"+toUser+"'";
//		StringBuilder sql = new StringBuilder();
//		sql.append("select ");
//		sql.append("a.id,a.vfromUser,a.vtoUser,a.vpageType,a.vpageCode,a.vsendDate,a.vurl,a.vdescription,a.ts ");
//		sql.append("from blct_relation a ");
//		sql.append("order by a.ts ");
//		if(StringUtil.isNotEmpty(toUser)){
//			sql.append("where vtoUser ="+toUser);
//		}
//		Integer count = getCountBySQL(sql.toString());
//		List<RelationVO> list = (List<RelationVO>)findListBySQL(sql.toString(), null, 0, count);
		return findAll(RelationVO.class, wh, null, "ts","desc");
	}

	@Override
	public List<RelationVO> findRelationList(String wh) {
		return null;
	}

}
