package com.bavlo.counter.service.custom.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.bavlo.counter.constant.IConstant;
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
	public void saveCustomB(Integer id, String json) {
		try {
			
			ArrayList<CustomBVO> listbvo = new ArrayList<CustomBVO>();

			JSONObject jsonBVO = JSONObject.fromObject(json);
			
			String filemodel = jsonBVO.get("filemodel") + "";
			String vtype = jsonBVO.get("vtype") + "";
			String FILE_0 = jsonBVO.get("FILE_0") + "";
			if(StringUtil.isNotEmpty(FILE_0)){
				CustomBVO bvo_0 = new CustomBVO();
				bvo_0.setCustomId(id);
				bvo_0.setVname(FILE_0);
				bvo_0.setVpath(filemodel);
				bvo_0.setVtype(vtype);
				bvo_0.setBiscover(IConstant.YES);
				listbvo.add(bvo_0);
			}
			String FILE_1 = jsonBVO.get("FILE_1") + "";
			if(StringUtil.isNotEmpty(FILE_1)){
				CustomBVO bvo_1 = new CustomBVO();
				bvo_1.setCustomId(id);
				bvo_1.setVname(FILE_1);
				bvo_1.setVtype(vtype);
				bvo_1.setVpath(filemodel);
				listbvo.add(bvo_1);
			}
			String FILE_2 = jsonBVO.get("FILE_2") + "";
			if(StringUtil.isNotEmpty(FILE_2)){
				CustomBVO bvo_2 = new CustomBVO();
				bvo_2.setCustomId(id);
				bvo_2.setVname(FILE_2);
				bvo_2.setVtype(vtype);
				bvo_2.setVpath(filemodel);
				listbvo.add(bvo_2);
			}
			String FILE_3 = jsonBVO.get("FILE_3") + "";
			if(StringUtil.isNotEmpty(FILE_3)){
				CustomBVO bvo_3 = new CustomBVO();
				bvo_3.setCustomId(id);
				bvo_3.setVname(FILE_3);
				bvo_3.setVtype(vtype);
				bvo_3.setVpath(filemodel);
				listbvo.add(bvo_3);
			}
			String FILE_4 = jsonBVO.get("FILE_4") + "";
			if(StringUtil.isNotEmpty(FILE_4)){
				CustomBVO bvo_4 = new CustomBVO();
				bvo_4.setCustomId(id);
				bvo_4.setVname(FILE_4);
				bvo_4.setVtype(vtype);
				bvo_4.setVpath(filemodel);
				listbvo.add(bvo_4);
			}
			String FILE_5 = jsonBVO.get("FILE_5") + "";
			if(StringUtil.isNotEmpty(FILE_5)){
				CustomBVO bvo_5 = new CustomBVO();
				bvo_5.setCustomId(id);
				bvo_5.setVname(FILE_5);
				bvo_5.setVtype(vtype);
				bvo_5.setVpath(filemodel);
				listbvo.add(bvo_5);
			}
			String FILE_6 = jsonBVO.get("FILE_6") + "";
			if(StringUtil.isNotEmpty(FILE_6)){
				CustomBVO bvo_6 = new CustomBVO();
				bvo_6.setCustomId(id);
				bvo_6.setVname(FILE_6);
				bvo_6.setVtype(vtype);
				bvo_6.setVpath(filemodel);
				listbvo.add(bvo_6);
			}
			String FILE_7 = jsonBVO.get("FILE_7") + "";
			if(StringUtil.isNotEmpty(FILE_7)){
				CustomBVO bvo_7 = new CustomBVO();
				bvo_7.setCustomId(id);
				bvo_7.setVname(FILE_7);
				bvo_7.setVtype(vtype);
				bvo_7.setVpath(filemodel);
				listbvo.add(bvo_7);
			}
			String FILE_8 = jsonBVO.get("FILE_8") + "";
			if(StringUtil.isNotEmpty(FILE_8)){
				CustomBVO bvo_8 = new CustomBVO();
				bvo_8.setCustomId(id);
				bvo_8.setVname(FILE_8);
				bvo_8.setVtype(vtype);
				bvo_8.setVpath(filemodel);
				listbvo.add(bvo_8);
			}
			String type = jsonBVO.get("vtype") + "";
			if(listbvo != null && id != null && type != null && StringUtil.isNotEmpty(type)){
				deleteCustomB(id,type);
				save(listbvo);
			}
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
				CustomVO vo = findFirstByDr(CustomVO.class," id="+dvo.getCustomId());
				if(vo != null){
					dvo.setVdef1(vo.getVcustomCode());
					dvo.setVdef2(vo.getId()+"");
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
				if(!CommonUtils.isNull(useGemVO.getNworth()+"")){
					dvo.setNstockGemCost(BigDecimal.valueOf(useGemVO.getNworth()));
					isupdate = true;
				}
				//形状
				if(StringUtil.isNotEmpty(useGemVO.getVshapeName())){
					dvo.setVstockGemShape(useGemVO.getVshapeName());
					isupdate = true;
				}
				//重量
				if(!CommonUtils.isNull(useGemVO.getNweight()+"")){
					dvo.setNstockGemWeight(BigDecimal.valueOf(useGemVO.getNweight()));
					isupdate = true;
				}
				//数量
				if(!CommonUtils.isNull(useGemVO.getIcount()+"")){
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

	@Override
	public void updateCustomVh(Integer id,String vh){
		String[] attrname = new String[]{"vengraveVh"};
		Object[] attrval = new Object[]{vh};
		Integer[] IDs = new Integer[]{id};
		updateAttrsByIDs(CustomVO.class, attrname, attrval, IDs);
	}

	@Override
	public void updateCustomCad(Integer id, String cad) {
		String[] attrname = new String[]{"vcadFile"};
		Object[] attrval = new Object[]{cad};
		Integer[] IDs = new Integer[]{id};
		updateAttrsByIDs(CustomVO.class, attrname, attrval, IDs);
	}

}
