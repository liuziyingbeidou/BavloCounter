package com.bavlo.counter.model.order;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: OrderBVO 
 * @Description: �����嵥
 * @author liuzy
 * @date 2015-10-26 ����05:51:38
 */
@Entity
@Table(name="blct_order_b")
public class OrderBVO extends IdEntity{
	
	private static final long serialVersionUID = 4925700523114266773L;
	/*
	 * ��������		bigint	
	 */
	private Integer orderId;
	/*
	 * (��Ʒ)��Դ����		varchar(20)	
	 */
	private String vsourceType;
	/*
	 * (��Ʒ)��Դ����		bigint	
	 */
	private String vsourceId;
	/*
	 * (��Ʒ����)
	 */
	private String vname;
	/*
	 * ����		int	
	 */
	private Integer nnumber;
	/*
	 * �۸�		decimal(20,8)
	 */
	private Double nprice;
	/*
	 * ͼƬ		String(50)	
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
