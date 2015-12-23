package com.bavlo.counter.service.useGem.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.useGem.itf.IUseGemService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.ObjectToJSON;
import com.bavlo.counter.utils.StringUtil;


/** 
 * @Title: 宝珑Counter
 * @ClassName: UseGemService 
 * @Description: 配石单实现
 * @author shijf
 * @date 2015-10-24 下午06:15:05  
 */
@Service("UseGemService")
public class UseGemService extends CommonService implements IUseGemService {

	@Resource
	private ICustomService customService;
	
	@Override
	public void saveUseGem(UseGemVO useGemVO) {

	}

	@Override
	public void deleteUseGem(UseGemVO useGemVO) {
		
	}

	@Override
	public void updateUseGem(UseGemVO useGemVO) {
		
	}
	
	@Override
	public Integer saveOrUpdateUseGem(UseGemVO useGemVO) {
		Integer id = useGemVO.getId();
		try {
			if(id == null){
				id = saveReID(useGemVO);
			}else{
				update(useGemVO);
			}
			customService.backCustomByUseGem(useGemVO.getCustomdId(), useGemVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public UseGemVO findUseGemById(Integer id) {
		String wh = " id ="+id;
		return findFirst(UseGemVO.class, wh);
	}

	@Override
	public List<UseGemVO> findUseGemByWh() {
		return null;
	}

	@Override
	public List<UseGemVO> findUseGemList(String wh) {
	
		StringBuilder sql = new StringBuilder();
		sql.append("select ");
		sql.append(" a.id,a.vnumber,a.vspec,a.vspec2,a.vspec3,b.vstock_gem_img_path as vdef1");
		sql.append(" from blct_useGem a");
		sql.append(" left join blct_custom_D b");
		sql.append(" on a.customd_id=b.id");
		sql.append(" left join blct_custom c");
		sql.append(" on b.custom_id=c.id");
		sql.append(" where ifnull(a.dr,0)=0 ");
		if(StringUtil.isNotEmpty(wh)){
			sql.append(" and" +wh);
		}
		
		Integer count = getCountBySQL(sql.toString());
		List<UseGemVO> list = (List<UseGemVO>)findListBySQL(sql.toString(), null, 0, count);
		List<UseGemVO> list_ = new ArrayList<UseGemVO>();
		if(list != null){
			String jsonstr = ObjectToJSON.writeListJSON(list);
			JSONArray jsonArr = JSONArray.fromObject(jsonstr);
			int size = jsonArr.size();
			for (int i = 0; i < size; i++) {
				UseGemVO dto = new UseGemVO();
				Object[] arry = jsonArr.getJSONArray(i).toArray();
				dto.setId(CommonUtils.isNull(arry[0]) ? null :Integer.valueOf(arry[0]+""));
				dto.setVnumber(CommonUtils.isNull(arry[1]) ? null :arry[1]+"");
				dto.setVspec(CommonUtils.isNull(arry[2]) ? null :arry[2]+"");
				dto.setVspec2(CommonUtils.isNull(arry[3]) ? null :arry[3]+"");
				dto.setVspec3(CommonUtils.isNull(arry[4]) ? null :arry[4]+"");
				dto.setVdef1(CommonUtils.isNull(arry[5]) ? null :arry[5]+"");
				list_.add(dto);
			}
		}
		
		return list_;
	}

}
