package com.bavlo.counter.service.manage.tools.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.manage.tools.QrcodeVO;
import com.bavlo.counter.model.manage.tools.SharePicVO;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.StringUtil;

/**
 * @Title: ����Counter
 * @ClassName: ToolsService 
 * @Description: ���߹���ʵ���� 
 * @author liuzy
 * @date 2015-12-7 ����04:09:58
 */
@Service("toolsService")
public class ToolsService extends CommonService implements IToolsService {

	@Override
	public QrcodeVO saveQrcode(QrcodeVO qrcodeVO) {
		
		Object obj = null;
		try {
			Integer id = qrcodeVO.getId();
			if(id == null){
				obj = saveReDTO(qrcodeVO) ;
			}else{
				update(qrcodeVO);
				obj = qrcodeVO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj != null ? (QrcodeVO)obj : null;
	}

	@Override
	public Map<String, Object> getListQrcode(String condition,Integer dgpage,
			Integer rows) {
		String conditions = null;
		if(StringUtil.isNotEmpty(condition)){
			if(condition.length() < 4){
				conditions = " vshop like '"+condition+"%' ";
			}else if(condition.length() == 4){
				conditions = " vkfcode ='"+condition+"' ";
			}else if(condition.length() > 4){
				conditions = "  concat(vshop,vkfcode) like '%"+condition+"%'";
			}
			
		}
		Integer total = getCountByHQL(QrcodeVO.class, conditions);
		List<QrcodeVO> listVO = findPage(QrcodeVO.class, dgpage, rows, conditions, "id", "desc");
		Map<String, Object> jsonmap = new HashMap<String, Object>();
		jsonmap.put("total", total);
		jsonmap.put("rows", listVO);
		
		return jsonmap;
	}
	
	@Override
	public QrcodeVO getQrcodeVOById(Integer id){
		String condition = null;
		if(StringUtil.isNotEmpty(id+"")){
			condition = " id="+id;
		}
		return findFirst(QrcodeVO.class, condition);
	}
	
	public List<QrcodeVO> getListQrcodePage(String condition,Integer dgpage,
			Integer rows) {
		int start = 0;
		int limit = 0;
		if (dgpage != null && rows != null) {
			start = (dgpage - 1) * rows;
			limit = rows;
		}
		return (List<QrcodeVO>) findListBySQL(condition, null, start,limit);
	}

	@Override
	public QrcodeVO getQrcodeVOByWh(String condition) {
		String conditions = null;
		if(StringUtil.isNotEmpty(condition)){
			conditions = condition;
		}
		return findFirst(QrcodeVO.class, conditions);
	}

	@Override
	public Integer saveSharePic(SharePicVO sharePicVO) {
		Integer id = null;
		try {
			id = saveReID(sharePicVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

	@Override
	public SharePicVO getSharePicVOById(Integer id) {
		SharePicVO vo = findFirst(SharePicVO.class, " id="+id);
		return vo;
	}

	@Override
	public void updateQrCodeStateById(Integer id) {
		if(id != null){
			String[] attrname = new String[]{"bisClose"};
			String[] attrval = new String[]{"Y"};
			String conditions = " id ="+id;
			updateAttrs(SharePicVO.class, attrname, attrval, conditions);
		}
	}
	
}
