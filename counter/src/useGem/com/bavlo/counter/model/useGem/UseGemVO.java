package com.bavlo.counter.model.useGem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;


/** 
 * @Title: 宝珑Counter
 * @ClassName: UseGemVO 
 * @Description: 配石单
 * @author shijf
 * @date 2015-10-23 下午03:18:17  
 */
@Entity
@Table(name="blct_useGem")
public class UseGemVO extends IdEntity {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 客户ID
	 */
	private Long customerId;
	/**
	 * 款式单ID
	 */
	private Long customId;
	/**
	 * 宝石ID
	 */
	private Long gemId;
	/**
	 * 库选石id
	 */
	private Integer customdId;
	/**
	 * 编号	
	 */
	@Column(length=50)
	private String vnumber;
	/**
	 * 声明类型	
	 */
	@Column(length=50)
	private String vtype;
	@Column(length=50)
	private String vtypeName;
	/**
	 * 声明价值		decimal(20,8)
	 */
	@Column(precision=20,scale=8)
	private Double nworth;
	/**
	 * 数量
	 */
	private Integer icount;
	/**
	 * 重量
	 */
	@Column(precision=20,scale=8)
	private Double nweight;
	/**
	 * 形状
	 */
	private String vshape;
	/**
	 * 形状
	 */
	private String vshapeName;
	/**
	 * 规格
	 */
	private String vspec;
	/**
	 * 规格2
	 */
	private String vspec2;
	/**
	 * 规格3
	 */
	private String vspec3;
	/**
	 * 创建时间	
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
	public Integer getCustomdId() {
		return customdId;
	}
	public void setCustomdId(Integer customdId) {
		this.customdId = customdId;
	}
	public String getVspec2() {
		return vspec2;
	}
	public void setVspec2(String vspec2) {
		this.vspec2 = vspec2;
	}
	public String getVspec3() {
		return vspec3;
	}
	public void setVspec3(String vspec3) {
		this.vspec3 = vspec3;
	}
	public String getVtypeName() {
		return vtypeName;
	}
	public void setVtypeName(String vtypeName) {
		this.vtypeName = vtypeName;
	}
	public String getVshapeName() {
		return vshapeName;
	}
	public void setVshapeName(String vshapeName) {
		this.vshapeName = vshapeName;
	}
}
