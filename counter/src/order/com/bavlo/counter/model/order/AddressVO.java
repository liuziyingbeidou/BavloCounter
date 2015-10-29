package com.bavlo.counter.model.order;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: AddressVO 
 * @Description: ������ַ
 * @author liuzy
 * @date 2015-10-27 ����02:34:20
 */
@Entity
@Table(name="blct_address")
public class AddressVO extends IdEntity {

	private static final long serialVersionUID = 7166735690856029270L;
	/*
	 * �ͻ�����		bigint	
	 */
	private Integer customerId;		
	/*
	 * ������		varchar(50)		
	 */
	@Column(length=50)
	private String vreceiverName;		
	/*
	 * ����		varchar(30)		
	 */
	@Column(length=30)
	private String vcountry;	
	/*
	 * ʡ��		varchar(30)	
	 */
	@Column(length=30)
	private String vprovince;			
	/*
	 * ��		varchar(30)		
	 */
	@Column(length=30)
	private String vcity;		
	/*
	 * ����		varchar(30)	
	 */
	@Column(length=30)
	private String vdistrict;			
	/*
	 * �ֵ�		varchar(255)			��ϸ��ַ����ֵ����ƣ����ƺ��룬¥��ͷ���ŵ���Ϣ
	 */
	@Column(length=255)
	private String vstreet;	
	/*
	 * �绰		varchar(50)	
	 */
	@Column(length=50)
	private String vphoneCode;			
	/*
	 * ����		varchar(50)	
	 */
	@Column(length=50)
	private String vemail;			
	/*
	 * �ʱ�		varchar(10)		
	 */
	@Column(length=10)
	private String vpostCode;		
	/*
	 * �Ƿ�Ĭ�ϵ�ַ		char(1)	��(Y);��(N)
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
