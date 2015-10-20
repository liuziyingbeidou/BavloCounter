package com.bavlo.counter.model.customer;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @author shijf
 *  客户信息实体类
 * 
 */
@Entity
@Table(name="blct_customer")
public class CustomerVO extends IdEntity {

	// 加盟店ID
	private Long agentId;
	// 客服编号
	private Long vserviceCode;
	// 客户姓名
	private String vname;
	// 客户昵称
	private String vnickname;
	// 客户性别
	private String vsex;
	// 客户手机号
	private Long vphoneCode;
	// 地址:国家
	private String vcontry;
	// 地址:省份
	private String vprovince;
	// 地址:城市
	private String vcity;
	// 地址:县区
	private String vdistrict;
	// 地址:街道
	private String vstreet;
	// 地址:邮编
	private Long vzipcode;
	// 邮箱
	private String vemail;
	// 客户微信号
	private String vwechat;
	// 客户的openid
	private String vopenid;
	// 客户语言
	private String vlanguage;
	// 客户头像
	private String vhendimgurl;
	// 客户关注时间
	private String vsubscribeTime;

	public Long getAgentId() {
		return agentId;
	}

	public void setAgentId(Long agentId) {
		this.agentId = agentId;
	}

	public Long getVserviceCode() {
		return vserviceCode;
	}

	public void setVserviceCode(Long vserviceCode) {
		this.vserviceCode = vserviceCode;
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
