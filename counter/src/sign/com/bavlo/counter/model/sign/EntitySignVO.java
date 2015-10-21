package com.bavlo.counter.model.sign;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: SignVO 
 * @Description: ʵ��(0)ǩ�յ�
 * @author liuzy
 * @date 2015-10-19 ����02:54:18
 */
@Entity
@Table(name="blct_entitysign")
public class EntitySignVO extends IdEntity {
	
	private static final long serialVersionUID = 1L;
	/**
	 * �ͻ�����		longint	
	 */
	private Long customerId;
	/**
	 * ���		varchar(50)	
	 */
	@Column(length=50)
	private String vnumber;
	/**
	 * ��������		varchar(100)	
	 */
	@Column(length=100)
	private String vtype;
	/**
	 * ������ֵ		decimal(20,8)
	 */
	@Column(precision=20,scale=8)
	private Double nworth;
	/**
	 * ����		int	
	 */
	private Integer icount;
	/**
	 * ����		decimal(20,8)	
	 */
	@Column(precision=20,scale=8)
	private Double nweight;
	/**
	 * ��״		varchar(50)	
	 */
	private String vshape;
	/**
	 * ���		varchar(50)	
	 */
	private String vspec;
	/**
	 * ���ռ۸�		decimal(20,8)	
	 */
	@Column(precision=20,scale=8)
	private Double nrecoveryPrice;	
	/**
	 * ����ʱ��		varchar(30)	
	 */
	private String vcreateTime;	

	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public String getVnumber() {
		return vnumber;
	}
	public void setVnumber(String vnumber) {
		this.vnumber = vnumber;
	}
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public Double getNworth() {
		return nworth;
	}
	public void setNworth(Double nworth) {
		this.nworth = nworth;
	}
	public Integer getIcount() {
		return icount;
	}
	public void setIcount(Integer icount) {
		this.icount = icount;
	}
	public Double getNweight() {
		return nweight;
	}
	public void setNweight(Double nweight) {
		this.nweight = nweight;
	}
	public String getVshape() {
		return vshape;
	}
	public void setVshape(String vshape) {
		this.vshape = vshape;
	}
	public String getVspec() {
		return vspec;
	}
	public void setVspec(String vspec) {
		this.vspec = vspec;
	}
	public Double getNrecoveryPrice() {
		return nrecoveryPrice;
	}
	public void setNrecoveryPrice(Double nrecoveryPrice) {
		this.nrecoveryPrice = nrecoveryPrice;
	}
	public String getVcreateTime() {
		return vcreateTime;
	}
	public void setVcreateTime(String vcreateTime) {
		this.vcreateTime = vcreateTime;
	}

}
