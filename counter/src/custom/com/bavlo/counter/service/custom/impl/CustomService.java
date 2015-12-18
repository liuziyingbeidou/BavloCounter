package com.bavlo.counter.service.custom.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomCVO;
import com.bavlo.counter.model.custom.CustomDVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.useGem.UseGemVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.ObjectToJSON;
import com.bavlo.counter.utils.StringUtil;


/** 
 * @Title: 宝珑Counter
 * @ClassName: CustomService 
 * @Description: 款式单service
 * @author shijf
 * @date 2015-10-20 下午04:12:30  
 */
@Service("CustomService")
public class CustomService extends CommonService implements ICustomService {

	@Override
	public void saveCustom(CustomVO customVO) {

	}
	
	@Override
	public Integer saveCustomRelID(CustomVO customVO) {
		Integer id = null;
		try {
			id = saveReID(customVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void deleteCustom(CustomVO customVO) {
		
	}

	@Override
	public void updateCustom(CustomVO customVO) {
		update(customVO);
	}
	
	@Override
	public void saveOrUpdateCustom(CustomVO customVO) {
		try {
			saveOrUpdate(customVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public CustomVO findCustomById(Integer id) {
		String wh = " id ="+id;
		CustomVO vo = findFirst(CustomVO.class, wh);
		String ckwh = " customId="+id +" and biscover='Y'"+ "and vtype='customCankao'";
		String sjwh = " customId="+id +" and biscover='Y'"+ "and vtype='customSheji'";
		CustomBVO customCankao = findFirst(CustomBVO.class, ckwh);
		CustomBVO customSheji = findFirst(CustomBVO.class, sjwh);
		if(customCankao != null){
			vo.setFILE_0(customCankao.getVpath()+"/min/"+CommonUtils.getMinPicName(customCankao.getVname()));//参考图封面
		}
		if(customSheji != null){
			vo.setFILE_1(customSheji.getVpath()+"/min/"+CommonUtils.getMinPicName(customSheji.getVname()));//设计图封面
		}
		
		return vo;
	}

	@Override
	public List<CustomVO> findCustomByWh(String content) {
		StringBuilder sql = new StringBuilder();
		sql.append("select ");
		sql.append(" a.id,a.vcustom_code,c.vname as vdef2,c.vhendimgurl as vdef1");
		sql.append(" from blct_custom a");
		sql.append(" left join blct_customer c");
		sql.append(" on a.customer_id=c.id");
		sql.append(" where ifnull(a.dr,0)=0");
		if(StringUtil.isNotEmpty(content)){
			sql.append(content);
		}
		
		Integer count = getCountBySQL(sql.toString());
		List<CustomVO> list = (List<CustomVO>)findListBySQL(sql.toString(), null, 0, count);
		List<CustomVO> list_ = new ArrayList<CustomVO>();
		if(list != null){
			if(!list.isEmpty()){
				String jsonstr = ObjectToJSON.writeListJSON(list);
				JSONArray jsonArr = JSONArray.fromObject(jsonstr);
				int size = jsonArr.size();
				for (int i = 0; i < size; i++) {
					CustomVO dto = new CustomVO();
					Object[] arry = jsonArr.getJSONArray(i).toArray();
					dto.setId(CommonUtils.isNull(arry[0]) ? null :Integer.valueOf(arry[0]+""));
					dto.setVcustomCode(CommonUtils.isNull(arry[1]) ? null : arry[1]+"");
					dto.setVdef2(CommonUtils.isNull(arry[2]) ? null : arry[2]+"");
					dto.setVdef1(CommonUtils.isNull(arry[3]) ? null : arry[3]+"");
					list_.add(dto);
				}
			}
		}
		
		return list_;
	}

	@Override
	public List<CustomVO> findCustomList(String wh) {
	
		return findAll(CustomVO.class, wh,null,"id","desc");
	}
	
	@Override
	public void saveCustomB(List<CustomBVO> listBVO) {
		try {
			save(listBVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteCustomB(Integer mid,String type) {
		List<CustomBVO>  list = findListCustomB(mid,type);
		if(list != null){
			for (CustomBVO customBVO : list) {
				delete(customBVO);
			}
		}
	}
	
	@Override
	public List<CustomBVO> findListCustomB(Integer mid,String type) {
		List<CustomBVO>  list = findAll(CustomBVO.class, " customId="+mid+ "and vtype='"+type+"'");
		return list;
	}
	
	@Override
	public List<CustomCVO> findListCustomC(Integer mid) {
		List<CustomCVO>  list = findAll(CustomCVO.class, " customId="+mid);
		return list;
	}
	
	@Override
	public List<CustomDVO> findListCustomD(Integer mid) {
		List<CustomDVO>  list = findAll(CustomDVO.class, " customId="+mid);
		return list;
	}

	@Override
	public void saveCustomC(List<CustomCVO> listCVO) {
		try {
			save(listCVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCustomC(Integer mid) {
		List<CustomCVO>  list = findListCustomC(mid);
		if(list != null){
			for (CustomCVO customCVO : list) {
				delete(customCVO);
			}
		}
	}

	@Override
	public void saveCustomD(List<CustomDVO> listDVO) {
		try {
			save(listDVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteCustomD(Integer mid) {
		List<CustomDVO>  list = findListCustomD(mid);
		if(list != null){
			for (CustomDVO customDVO : list) {
				delete(customDVO);
			}
		}
	}

	@Override
	public CustomDVO findCustomDVOBySql(Integer did) {
		CustomDVO dvo = null;
		if(did != null){
			dvo = findFirstByDr(CustomDVO.class, " id ="+did);
			if(dvo != null){
				CustomVO vo = findFirstByDr(CustomVO.class," id="+dvo.getId());
				if(vo != null){
					dvo.setVdef1(vo.getVcustomCode());
				}
			}
		}
		
		return dvo;
	}

	@Override
	public void backCustomByUseGem(Integer did, UseGemVO useGemVO) {
		if(StringUtil.isNotEmpty(did+"")){
			CustomDVO dvo = findFirst(CustomDVO.class, " id="+did);
			if(useGemVO != null){
				boolean isupdate = false;
				//类型
				if(StringUtil.isNotEmpty(useGemVO.getVtypeName())){
					dvo.setVstockGemName(useGemVO.getVtypeName());
					isupdate = true;
				}
				//价值
				if(StringUtil.isNotEmpty(useGemVO.getNworth()+"")){
					dvo.setNstockGemCost(BigDecimal.valueOf(useGemVO.getNworth()));
					isupdate = true;
				}
				//形状
				if(StringUtil.isNotEmpty(useGemVO.getVshapeName())){
					dvo.setVstockGemShape(useGemVO.getVshapeName());
					isupdate = true;
				}
				//重量
				if(StringUtil.isNotEmpty(useGemVO.getNweight()+"")){
					dvo.setNstockGemWeight(BigDecimal.valueOf(useGemVO.getNweight()));
					isupdate = true;
				}
				//数量
				if(StringUtil.isNotEmpty(useGemVO.getIcount()+"")){
					dvo.setIstockGemNum(useGemVO.getIcount());
					isupdate = true;
				}
				//规格
				if(StringUtil.isNotEmpty(useGemVO.getVspec()) && StringUtil.isNotEmpty(useGemVO.getVspec2()) && StringUtil.isNotEmpty(useGemVO.getVspec3())){
					dvo.setVstockGemSize(useGemVO.getVspec()+","+useGemVO.getVspec2()+","+useGemVO.getVspec3());
					isupdate = true;
				}
				if(isupdate){
					update(dvo);
				}
			}
		}
	}

}
