package com.bavlo.counter.model.order;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: OrderBVO 
 * @Description: 订单清单
 * @author liuzy
 * @date 2015-10-26 下午05:51:38
 */
@Entity
@Table(name="blct_order_b")
public class OrderBVO extends IdEntity{
	
	private static final long serialVersionUID = 4925700523114266773L;
	/*
	 * 主表主键		bigint	
	 */
	private Integer orderId;
	/*
	 * (物品)来源类型		varchar(20)	
	 */
	private String vsourceType;
	/*
	 * (物品)来源主键		bigint	
	 */
	private String vsourceId;
	/*
	 * (物品名称)
	 */
	private String vname;
	/*
	 * 数量		int	
	 */
	private Integer nnumber;
	/*
	 * 价格		decimal(20,8)
	 */
	private Double nprice;
	/*
	 * 图片		String(50)	
	 */
	private String vpic;
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getVsourceType() {
		return vsourceType;
	}
	public void setVsourceType(String vsourceType) {
		this.vsourceType = vsourceType;
	}
	public String getVsourceId() {
		return vsourceId;
	}
	public void setVsourceId(String vsourceId) {
		this.vsourceId = vsourceId;
	}
	public Integer getNnumber() {
		return nnumber;
	}
	public void setNnumber(Integer nnumber) {
		this.nnumber = nnumber;
	}
	public Double getNprice() {
		return nprice;
	}
	public void setNprice(Double nprice) {
		this.nprice = nprice;
	}
	public String getVpic() {
		return vpic;
	}
	public void setVpic(String vpic) {
		this.vpic = vpic;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}

}
