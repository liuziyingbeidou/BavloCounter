package com.bavlo.counter.model.useGem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;


/** 
 * @Title: ����Counter
 * @ClassName: UseGemVO 
 * @Description: ��ʯ��
 * @author shijf
 * @date 2015-10-23 ����03:18:17  
 */
@Entity
@Table(name="blct_useGem")
public class UseGemVO extends IdEntity {
	
	private static final long serialVersionUID = 1L;
	/**
	 * �ͻ�ID
	 */
	private Long customerId;
	/**
	 * ���Ƶ�ID
	 */
	private Long customId;
	/**
	 * ��ʯID
	 */
	private Long gemId;
	/**
	 * ���	
	 */
	@Column(length=50)
	private String vnumber;
	/**
	 * ��������	
	 */
	@Column(length=50)
	private String vtype;
	/**
	 * ������ֵ		decimal(20,8)
	 */
	@Column(precision=20,scale=8)
	private Double nworth;
	/**
	 * ����
	 */
	private Integer icount;
	/**
	 * ����
	 */
	@Column(precision=20,scale=8)
	private Double nweight;
	/**
	 * ��״
	 */
	private String vshape;
	/**
	 * ���
	 */
	private String vspec;
	/**
	 * ����ʱ��	
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
	public String getVcreateTime() {
		return vcreateTime;
	}
	public void setVcreateTime(String vcreateTime) {
		this.vcreateTime = vcreateTime;
	}
	public void setGemId(Long gemId) {
		this.gemId = gemId;
	}
	public Long getGemId() {
		return gemId;
	}
	public void setCustomId(Long customId) {
		this.customId = customId;
	}
	public Long getCustomId() {
		return customId;
	}
	public void setNworth(Double nworth) {
		this.nworth = nworth;
	}
	public Double getNworth() {
		return nworth;
	}

}
