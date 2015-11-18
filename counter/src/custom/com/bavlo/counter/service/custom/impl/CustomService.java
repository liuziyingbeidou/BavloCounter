package com.bavlo.counter.service.custom.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.ObjectToJSON;
import com.bavlo.counter.utils.StringUtil;


/** 
 * @Title: 宝珑Counter
 * @ClassName: CustomService 
 * @Description: 定制单service
 * @author shijf
 * @date 2015-10-20 下午04:12:30  
 */
@Service("CustomService")
public class CustomService extends CommonService implements ICustomService {
	
	
	@Resource
	private IOrderService orderService;

	@Override
	public void saveCustom(CustomVO customVO) {

	}

	@Override
	public void deleteCustom(CustomVO customVO) {
		
	}

	@Override
	public void updateCustom(CustomVO customVO) {
		
	}
	
	@Override
	public void saveOrUpdateCustom(CustomVO customVO) {
		try {
			saveOrUpdate(customVO);
//			orderService.backWriteByCum(customVO.getOrderId(), customVO.getCustomerId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public CustomVO findCustomById(Integer id) {
		String wh = " id ="+id;
		return findFirst(CustomVO.class, wh);
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
	public void deleteCustomB(Integer mid) {
		List<CustomBVO>  list = findListCustomB(mid);
		if(list != null){
			for (CustomBVO customBVO : list) {
				delete(customBVO);
			}
		}
	}
	
	@Override
	public List<CustomBVO> findListCustomB(Integer mid) {
		List<CustomBVO>  list = findAll(CustomBVO.class, " customId="+mid);
		return list;
	}

}
