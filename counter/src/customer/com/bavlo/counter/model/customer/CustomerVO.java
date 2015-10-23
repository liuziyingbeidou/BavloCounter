package com.bavlo.counter.model.customer;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @author shijf
 *  �ͻ���Ϣʵ����
 * 
 */
@Entity
@Table(name="blct_customer")
public class CustomerVO extends IdEntity {

	private static final long serialVersionUID = 1L;	
	/** 
	 * ���˵�ID 
	 */ 
	private Long agentId;
	/** 
	 * �ͷ����
	 */ 
	@Column(length=50)
	private String vserviceCode;
	/** 
	 * �ͻ���� 
	 */ 
	@Column(length=50)
	private String vcustomerCode;
	/** 
	 * �ͻ����� 
	 */ 
	@Column(length=50)
	private String vname;
	/** 
	 * �ͻ��ǳ�
	 */ 
	@Column(length=50)
	private String vnickname;
	/** 
	 * �ͻ��Ա� 
	 */ 
	@Column(length=50)
	private String vsex;
	/** 
	 * �ͻ��ֻ���
	 */ 
	private Long vphoneCode;
	/** 
	 * ��ַ������ 
	 */ 
	@Column(length=50)
	private String vcontry;
	/** 
	 * ��ַ��ʡ��
	 */ 
	@Column(length=50)
	private String vprovince;
	/** 
	 * ��ַ������ 
	 */ 
	@Column(length=50)
	private String vcity;
	/** 
	 * ��ַ������ 
	 */ 
	@Column(length=50)
	private String vdistrict;
	/** 
	 * ��ַ���ֵ�
	 */ 
	@Column(length=50)
	private String vstreet;
	/** 
	 * ��ַ���ʱ� 
	 */ 
	private Long vzipcode;
	/** 
	 * �ͻ����� 
	 */ 
	@Column(length=50)
	private String vemail;
	/** 
	 * �ͻ�΢�ź�
	 */ 
	@Column(length=50)
	private String vwechat;
	/** 
	 * �ͻ���openid
	 */ 
	@Column(length=50)
	private String vopenid;
	/** 
	 * �ͻ����� 
	 */ 
	@Column(length=50)
	private String vlanguage;
	/** 
	 * �ͻ�ͷ���ַ 
	 */ 
	@Column(length=50)
	private String vhendimgurl;
	/** 
	 * �ͻ���עʱ��
	 */ 
	@Column(length=50)
	private String vsubscribeTime;

	public Long getAgentId() {
		return agentId;
	}

	public void setAgentId(Long agentId) {
		this.agentId = agentId;
	}

	public String getVserviceCode() {
		return vserviceCode;
	}

	public void setVserviceCode(String vserviceCode) {
		this.vserviceCode = vserviceCode;
	}
	
	public String getVcustomerCode() {
		return vcustomerCode;
	}
	
	public void setVcustomerCode(String vcustomerCode) {
		this.vcustomerCode = vcustomerCode;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVnickname() {
		return vnickname;
	}

	public void setVnickname(String vnickname) {
		this.vnickname = vnickname;
	}

	public String getVsex() {
		return vsex;
	}

	public void setVsex(String vsex) {
		this.vsex = vsex;
	}

	public Long getVphoneCode() {
		return vphoneCode;
	}

	public void setVphoneCode(Long vphoneCode) {
		this.vphoneCode = vphoneCode;
	}

	public String getVcontry() {
		return vcontry;
	}

	public void setVcontry(String vcontry) {
		this.vcontry = vcontry;
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

	public Long getVzipcode() {
		return vzipcode;
	}

	public void setVzipcode(Long vzipcode) {
		this.vzipcode = vzipcode;
	}

	public String getVemail() {
		return vemail;
	}

	public void setVemail(String vemail) {
		this.vemail = vemail;
	}

	public String getVwechat() {
		return vwechat;
	}

	public void setVwechat(String vwechat) {
		this.vwechat = vwechat;
	}

	public String getVopenid() {
		return vopenid;
	}

	public void setVopenid(String vopenid) {
		this.vopenid = vopenid;
	}

	public String getVlanguage() {
		return vlanguage;
	}

	public void setVlanguage(String vlanguage) {
		this.vlanguage = vlanguage;
	}

	public String getVhendimgurl() {
		return vhendimgurl;
	}

	public void setVhendimgurl(String vhendimgurl) {
		this.vhendimgurl = vhendimgurl;
	}

	public String getVsubscribeTime() {
		return vsubscribeTime;
	}

	public void setVsubscribeTime(String vsubscribeTime) {
		this.vsubscribeTime = vsubscribeTime;
	}

}
