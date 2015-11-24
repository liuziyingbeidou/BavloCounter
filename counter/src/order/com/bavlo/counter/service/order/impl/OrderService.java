package com.bavlo.counter.service.order.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.bavlo.counter.constant.IConstant;
import com.bavlo.counter.model.custom.CustomBVO;
import com.bavlo.counter.model.custom.CustomVO;
import com.bavlo.counter.model.order.AddressVO;
import com.bavlo.counter.model.order.OrderBVO;
import com.bavlo.counter.model.order.OrderCVO;
import com.bavlo.counter.model.order.OrderVO;
import com.bavlo.counter.service.custom.itf.ICustomService;
import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.order.itf.IOrderService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.utils.ObjectToJSON;
import com.bavlo.counter.utils.StringUtil;

/**
 * @Title: 宝珑Counter
 * @ClassName: OrderService 
 * @Description: 订单Service
 * @author liuzy
 * @date 2015-10-27 下午02:48:01
 */
@Service("orderService")
public class OrderService extends CommonService implements IOrderService {

	@Resource
	ICustomService customService;
	
	@Override
	public Integer saveOrderRelID(OrderVO orderVO) {
		Integer id = null;
		try {
			id = saveReID(orderVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public OrderVO saveOrderRelVO(OrderVO orderVO){
		OrderVO vo = new OrderVO();
		try {
			vo = (OrderVO)saveReDTO(orderVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	@Override
	public void saveOrderBVO(Integer id,List<OrderBVO> orderListBVO){
		try {
			for (OrderBVO orderBVO : orderListBVO) {
				orderBVO.setOrderId(id);
			}
			save(orderListBVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void updateOrder(OrderVO orderVO) {
		update(orderVO);
	}

	@Override
	public List<OrderVO> findListOrder(String wh) {
		
		return findAll(OrderVO.class, wh,null,"ts","desc");
	}
	
	@Override
	public List<OrderVO> findListOrderBySql(String wh){
		
		StringBuilder sql = new StringBuilder();
		sql.append("select ");
		sql.append(" a.id,b.vname as customerName,a.vorder_code,a.iorder_state,a.nquoted_price,a.npayment,a.nnon_payment,a.ntail_paid,b.vhendimgurl as vdef1");
		sql.append(" from blct_order a");
		sql.append(" left join blct_customer b");
		sql.append(" on a.customer_id=b.id");
		if(StringUtil.isNotEmpty(wh)){
			sql.append(" where a.vorder_code like '%"+wh+"%'");
		}
		sql.append(" order by a.id desc");
		
		Integer count = getCountBySQL(sql.toString());
		List<OrderVO> list = (List<OrderVO>)findListBySQL(sql.toString(), null, 0, count);
		List<OrderVO> nList = new ArrayList<OrderVO>();
		if(list != null){
			String jsonstr = ObjectToJSON.writeListJSON(list);
			JSONArray jsonArr = JSONArray.fromObject(jsonstr);
			int size = jsonArr.size();
			for (int i = 0; i < size; i++) {
				OrderVO dto = new OrderVO();
				Object[] arry = jsonArr.getJSONArray(i).toArray();
				Integer id = CommonUtils.isNull(arry[0]) ? null :Integer.valueOf(arry[0]+"");
				dto.setId(id);
				dto.setCustomerName(CommonUtils.isNull(arry[1]) ? null :arry[1]+"");
				dto.setVorderCode(CommonUtils.isNull(arry[2]) ? null :arry[2]+"");
				dto.setIorderState(CommonUtils.isNull(arry[3]) ? null :Integer.valueOf(arry[3]+""));
				dto.setNquotedPrice(CommonUtils.isNull(arry[4]) ? null :Double.valueOf(arry[4]+""));
				dto.setNpayment(CommonUtils.isNull(arry[5]) ? null :Double.valueOf(arry[5]+""));
				dto.setNnonPayment(CommonUtils.isNull(arry[6]) ? null :Double.valueOf(arry[6]+""));
				dto.setNtailPaid(CommonUtils.isNull(arry[7]) ? null :Double.valueOf(arry[7]+""));
				dto.setVdef1(CommonUtils.isNull(arry[8]) ? null :arry[8]+"");
				
				nList.add(dto);
			}
		}
		
		return nList;
	}
	
	@Override
	public List<CustomBVO> getCumPicList(Integer id){
		/**订单中定制单默认图-start**/
		List<CustomBVO> list = new ArrayList<CustomBVO>();
		if(id != null){
			StringBuilder bsql = new StringBuilder();
			bsql.append("select ");
			bsql.append(" d.id,d.vname,d.vpath");
			bsql.append(" from blct_order_b b");
			bsql.append(" left join blct_custom c");
			bsql.append(" on (b.vsource_id+0)=c.id");
			bsql.append(" left join blct_custom_b d");
			bsql.append(" on c.id=d.custom_id");
			bsql.append(" where d.biscover='Y'");
			bsql.append(" and b.order_id="+id);
			
			Integer num = getCountBySQL(bsql.toString());
			List<CustomBVO> list_ = (List<CustomBVO>)findListBySQL(bsql.toString(), null, 0, num);
			if(list_ != null){
				String jsonstr_ = ObjectToJSON.writeListJSON(list_);
				JSONArray jsonArr_ = JSONArray.fromObject(jsonstr_);
				int size_ = jsonArr_.size();
				for (int j = 0; j < size_; j++) {
					CustomBVO dto = new CustomBVO();
					Object[] arry = jsonArr_.getJSONArray(j).toArray();
					dto.setId(CommonUtils.isNull(arry[0]) ? null :Integer.valueOf(arry[0]+""));
					dto.setVname(CommonUtils.isNull(arry[0]) ? null :arry[0]+"");
					dto.setVpath(CommonUtils.isNull(arry[0]) ? null :arry[0]+"");
					list.add(dto);
				}
			}
		}
		return list;
		/**订单中定制单默认图-end**/
	}

	@Override
	public OrderVO findSigleOrder(Integer id) {
		String wh = " id ="+id;
		return findFirst(OrderVO.class, wh);
	}
	
	@Override
	public void delOrderById(Integer id){
		delete(OrderVO.class, id);
		delOrderByMid(id);
	}
	
	@Override
	public void delOrderByMid(Integer mid){
		List<OrderBVO> list = findListOrderBVO(mid);
		if(list != null){
			for (OrderBVO orderBVO : list) {
				delete(orderBVO);
			}
		}
	}
	
	@Override
	public List<OrderBVO> findListOrderBVO(Integer mid){
		return findAll(OrderBVO.class, " orderId="+mid);
	}
	
	@Override
	public OrderVO findOrderInfoBySql(Integer id){
		StringBuilder sql = new StringBuilder();
		sql.append("select ");
		sql.append(" a.id,a.vdelivery_way,a.ddeliverdate,a.vinvoice_title,a.vinvoice_content,a.vordermemo,a.iorder_state,a.vorder_code,a.vcourier_number");
		sql.append(",c.vreceiver_name as vrname,c.vprovince vdef1,c.vcity as vdef2,c.vdistrict as vdef3,c.vstreet as vdef4,c.vphone_code as vtel,c.vemail as vmail");
		sql.append(" from blct_order a");
		sql.append(" left join blct_address c");
		sql.append(" on a.address_id=c.id");
		sql.append(" where a.id="+id);
		
		Integer count = getCountBySQL(sql.toString());
		List<OrderVO> list = (List<OrderVO>)findListBySQL(sql.toString(), null, 0, count);
		List<OrderVO> nList = new ArrayList<OrderVO>();
		if(list != null){
			String jsonstr = ObjectToJSON.writeListJSON(list);
			JSONArray jsonArr = JSONArray.fromObject(jsonstr);
			int size = jsonArr.size();
			for (int i = 0; i < size; i++) {
				OrderVO dto = new OrderVO();
				Object[] arry = jsonArr.getJSONArray(i).toArray();
				dto.setId(CommonUtils.isNull(arry[0]) ? null :Integer.valueOf(arry[0]+""));
				dto.setVdeliveryWay(CommonUtils.isNull(arry[1]) ? null :arry[1]+"");
				dto.setDdeliverdate(CommonUtils.isNull(arry[2]) ? null :arry[2]+"");
				dto.setVinvoiceTitle(CommonUtils.isNull(arry[3]) ? null :arry[3]+"");
				dto.setVinvoiceContent(CommonUtils.isNull(arry[4]) ? null :arry[4]+"");
				dto.setVordermemo(CommonUtils.isNull(arry[5]) ? null :arry[5]+"");
				Integer ista = CommonUtils.isNull(arry[6]) ? null :Integer.valueOf(arry[6]+"");
				if(ista == null){
					ista = -1;
				}
				dto.setIorderState(ista);
				String vsta = "提交";
				switch(ista){
				//未提交(-1)、提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
				case -1: vsta = "未提交";break;
				case 0: vsta = "提交";break;
				case 1: vsta = "制版";break;
				case 2: vsta = "生产";break;
				case 3: vsta = "质检";break;
				case 4: vsta = "快递";break;
				case 5: vsta = "支付";break;
				}
				dto.setOrderState(vsta);
				dto.setVorderCode(CommonUtils.isNull(arry[7]) ? "" :arry[7]+"");
				dto.setVcourierNumber(CommonUtils.isNull(arry[8]) ? "" :arry[8]+"");
				dto.setVrname(CommonUtils.isNull(arry[9]) ? "" :arry[9]+"");
				String vdef1 = CommonUtils.isNull(arry[10]) ? "" :arry[10]+"";
				String vdef2 = CommonUtils.isNull(arry[11]) ? "" :arry[11]+"";
				String vdef3 = CommonUtils.isNull(arry[12]) ? "" :arry[12]+"";
				String vdef4 = CommonUtils.isNull(arry[13]) ? "" :arry[13]+"";
				dto.setVaddress(vdef1+ " " + vdef2 + " " + vdef3 + " " +  vdef4);
				dto.setVtel(CommonUtils.isNull(arry[14]) ? "" :arry[14]+"");
				dto.setVmail(CommonUtils.isNull(arry[15]) ? "" :arry[15]+"");
				nList.add(dto);
			}
		}
		OrderVO vo = nList.get(0);
		String bwh = " orderId="+id +" and biscover='Y'";
		OrderCVO bvo = findFirst(OrderCVO.class, bwh);
		if(bvo != null){
			vo.setFILE_0(bvo.getVpath()+"/min/"+CommonUtils.getMinPicName(bvo.getVname()));//封面
		}
		
		return vo;
	}
	
	@Override
	public void delOrderCVOByMid(Integer mid){
		List<OrderCVO>  list = findListOrderC(mid);
		if(list != null){
			for (OrderCVO orderCVO : list) {
				delete(orderCVO);
			}
		}
	}
	
	@Override
	public List<OrderCVO> findListOrderC(Integer mid) {
		List<OrderCVO>  list = findAll(OrderCVO.class, " orderId="+mid);
		return list;
	}
	
	@Override
	public void saveOrderCVO(List<OrderCVO> listcvo){
		try {
			save(listcvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void delOrderBVOById(Integer srcid) {
		delete(OrderBVO.class, " and vsourceId="+srcid);
	}
	
	/*******************************以下是交付地址***********************************/
	
	@Override
	public Integer saveAddrRelID(AddressVO addressVO) {
		Integer id = null;
		try {
			Integer custId = addressVO.getCustomerId();
			Integer count = getCountByHQL(AddressVO.class, " customerId="+custId);
			if(count == 0){
				addressVO.setBisDefault("Y");
			}
			id = saveReID(addressVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateAddr(AddressVO addressVO) {
		Integer id = addressVO.getId();
		AddressVO srcvo = findFirst(AddressVO.class, " id="+id);
		addressVO.setBisDefault(srcvo.getBisDefault());
		update(addressVO);
	}

	@Override
	public List<AddressVO> findListAddr(String wh) {
		return findAll(AddressVO.class, wh,null,"ts","desc");
	}

	@Override
	public AddressVO findSigleAddr(Integer id) {
		String wh = " id ="+id;
		return findFirst(AddressVO.class, wh);
	}

	@Override
	public void delAddrById(Integer id) {
		delete(AddressVO.class, id);
	}
	
	/*************************回写****************************/
	/**
	 * 定制单保存回写订单价格
	 * @param orderId 订单ID
	 * @param customId 定制单ID
	 */
	public void backWriteByCum(Integer orderId,Integer customId){
		CustomVO vo = customService.findCustomById(customId);
		if(vo != null){
			String bwh = " customId="+customId +" and biscover='Y'";
			CustomBVO cbvo = findFirst(CustomBVO.class, bwh);
			if(cbvo != null){
				vo.setFILE_0(cbvo.getVpath()+"/min/"+CommonUtils.getMinPicName(cbvo.getVname()));//封面
			}
			
			String[] attrname = new String[]{"nprice","vpic"};
			Object[] attrval = new Object[]{vo.getNprice(),vo.getFILE_0()};
			String wh = " orderId="+orderId+" and vsourceId="+customId;
			
			Integer count = getCountByHQL(OrderBVO.class, wh);
			
			if(count > 0){
				updateAttrs(OrderBVO.class, attrname, attrval, wh);
			}else{
				OrderBVO bvo = new OrderBVO();
				bvo.setOrderId(orderId);
				bvo.setVsourceId(customId+"");
				bvo.setNnumber(1);
				bvo.setNprice(CommonUtils.isNull(vo.getNprice()) ? 0.0 : Double.valueOf(vo.getNprice()+""));
				bvo.setVpic(vo.getFILE_0());
				bvo.setVsourceType("dz");
				try {
					save(bvo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 回写订单状态
	 * @param orderId
	 * @param ista 提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
	 */
	public void updateOrderState(Integer orderId,Integer ista){
		String[] attrname = new String[]{"iorderState"};
		Object[] attrval = new Object[]{ista};
		Integer[] IDs = new Integer[]{orderId};
		updateAttrsByIDs(OrderVO.class, attrname, attrval, IDs);
	}
	
	/**
	 * 回写快递单号 且 回写订单状态
	 * @param orderId
	 * @param cnum
	 */
	public void updateOrderCNumber(Integer orderId,String cnum){
		String[] attrname = new String[]{"vcourierNumber","iorderState"};
		Object[] attrval = new Object[]{cnum,IConstant.ORDER_EXPRESS};
		Integer[] IDs = new Integer[]{orderId};
		updateAttrsByIDs(OrderVO.class, attrname, attrval, IDs);
	}
	
	public void updateNumByCumId(Integer orderId,String cumId,Integer num){
		String[] attrname = new String[]{"nnumber"};
		Object[] attrval = new Object[]{num};
		String wh = " orderId="+orderId+" and vsourceId="+cumId;
		
		updateAttrs(OrderBVO.class, attrname, attrval, wh);
	}
}
