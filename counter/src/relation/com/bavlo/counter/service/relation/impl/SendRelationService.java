package com.bavlo.counter.service.relation.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.relation.SendRelationVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.relation.itf.ISendRelationService;
import com.bavlo.counter.utils.DateUtil;

@Service("SendRelationService")
public class SendRelationService extends CommonService implements ISendRelationService {

	@Override
	public void saveSendRelation(SendRelationVO sendRelationVO) {
		try {
			save(sendRelationVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateSendRelation(SendRelationVO sendRelationVO) {
		update(sendRelationVO);
	}

	@Override
	public void deleteSendRelation(SendRelationVO sendRelationVO) {
	}

	@Override
	public Integer saveOrUpdateSendRelation(SendRelationVO sendRelationVO) {
		String fromUser = sendRelationVO.getVfromUser();
		String toUser = sendRelationVO.getVtoUser();
		String url = sendRelationVO.getVurl();
		Integer id = null;
		if(fromUser != null && toUser != null && url != null){
			//查找转发记录
			String wh = " vfromUser ="+fromUser + "and vtoUser ="+toUser + "and vurl ="+url;
			SendRelationVO vo = findFirst(SendRelationVO.class, wh);
			Timestamp ts = DateUtil.getStrTimestamp(DateUtil.getCurDateTime());
			if(vo != null){
				id = vo.getId();
				//更新时间戳
				vo.setTs(ts);
				update(vo);
			} else {
				id = sendRelationVO.getId();
				sendRelationVO.setTs(ts);
				try {
					save(sendRelationVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return id;
	}

	@Override
	public SendRelationVO findSendRelationById(Integer id) {
		String wh = " id ="+id;
		return findFirst(SendRelationVO.class, wh);
	}
	
	@Override
	public SendRelationVO findSendRelationByWh(String wh) {
		return findFirst(SendRelationVO.class, wh);
	}
	
	@Override
	public List<SendRelationVO> findSendRelationByToUser(String toUser) {
		String wh = " vtoUser ="+toUser;
//		StringBuilder sql = new StringBuilder();
//		sql.append("select ");
//		sql.append("a.id,a.vfromUser,a.vtoUser,a.vpageType,a.vpageCode,a.vsendDate,a.vurl,a.vdescription,a.ts ");
//		sql.append("from blct_sendRelation a ");
//		sql.append("order by a.ts ");
//		if(StringUtil.isNotEmpty(toUser)){
//			sql.append("where vtoUser ="+toUser);
//		}
//		Integer count = getCountBySQL(sql.toString());
//		List<SendRelationVO> list = (List<SendRelationVO>)findListBySQL(sql.toString(), null, 0, count);
		return findAll(SendRelationVO.class, wh, null, "ts","desc");
	}

	@Override
	public List<SendRelationVO> findSendRelationList(String wh) {
		return null;
	}

}
