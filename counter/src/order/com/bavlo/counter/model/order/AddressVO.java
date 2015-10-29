package com.bavlo.counter.model.order;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: AddressVO 
 * @Description: 交付地址
 * @author liuzy
 * @date 2015-10-27 下午02:34:20
 */
@Entity
@Table(name="blct_address")
public class AddressVO extends IdEntity {

	private static final long serialVersionUID = 7166735690856029270L;
	/*
	 * 客户主键		bigint	
	 */
	private Integer customerId;		
	/*
	 * 交付人		varchar(50)		
	 */
	@Column(length=50)
	private String vreceiverName;		
	/*
	 * 国家		varchar(30)		
	 */
	@Column(length=30)
	private String vcountry;	
	/*
	 * 省份		varchar(30)	
	 */
	@Column(length=30)
	private String vprovince;			
	/*
	 * 市		varchar(30)		
	 */
	@Column(length=30)
	private String vcity;		
	/*
	 * 县区		varchar(30)	
	 */
	@Column(length=30)
	private String vdistrict;			
	/*
	 * 街道		varchar(255)			详细地址：如街道名称，门牌号码，楼层和房间号等信息
	 */
	@Column(length=255)
	private String vstreet;	
	/*
	 * 电话		varchar(50)	
	 */
	@Column(length=50)
	private String vphoneCode;			
	/*
	 * 邮箱		varchar(50)	
	 */
	@Column(length=50)
	private String vemail;			
	/*
	 * 邮编		varchar(10)		
	 */
	@Column(length=10)
	private String vpostCode;		
	/*
	 * 是否默认地址		char(1)	是(Y);否(N)
	 */
	@Column(length=1,columnDefinition="char")
	private String bisDefault;
	
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getVreceiverName() {
		return vreceiverName;
	}
	public void setVreceiverName(String vreceiverName) {
		this.vreceiverName = vreceiverName;
	}
	public String getVcountry() {
		return vcountry;
	}
	public void setVcountry(String vcountry) {
		this.vcountry = vcountry;
	}
	public String getVprovince() {
		return vprovince;
	}
	public void setVprovince(String vprovince) {
		this.vprovince = vprovince;
	}
	public String getVcity() {
		return vcity;
	}
	public void setVcity(String vcity) {
		this.vcity = vcity;
	}
	public String getVdistrict() {
		return vdistrict;
	}
	public void setVdistrict(String vdistrict) {
		this.vdistrict = vdistrict;
	}
	public String getVstreet() {
		return vstreet;
	}
	public void setVstreet(String vstreet) {
		this.vstreet = vstreet;
	}
	public String getVphoneCode() {
		return vphoneCode;
	}
	public void setVphoneCode(String vphoneCode) {
		this.vphoneCode = vphoneCode;
	}
	public String getVemail() {
		return vemail;
	}
	public void setVemail(String vemail) {
		this.vemail = vemail;
	}
	public String getVpostCode() {
		return vpostCode;
	}
	public void setVpostCode(String vpostCode) {
		this.vpostCode = vpostCode;
	}
	public String getBisDefault() {
		return bisDefault;
	}
	public void setBisDefault(String bisDefault) {
		this.bisDefault = bisDefault;
	}			

}
