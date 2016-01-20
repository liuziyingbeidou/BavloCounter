package com.bavlo.counter.model.relation;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: RelationVO
 * @Description: 关联实体类
 * @author shijf
 * @date 2016年1月11日 上午11:19:23
 */
@Entity
@Table(name = "blct_relation")
public class RelationVO extends IdEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 发送者
	 */
	private String vfromUser;
	/**
	 * 接收者
	 */
	private String vtoUser;
	/**
	 * 页面类型
	 */
	private String vpageType;
	/**
	 * 页面编号
	 */
	private String vpageCode;
	/**
	 * 发送的链接
	 */
	private String vurl;
	/**
	 * 状态 0.未读 1.已读
	 */
	private Integer istatus;

	public String getVfromUser() {
		return vfromUser;
	}

	public void setVfromUser(String vfromUser) {
		this.vfromUser = vfromUser;
	}

	public String getVtoUser() {
		return vtoUser;
	}

	public void setVtoUser(String vtoUser) {
		this.vtoUser = vtoUser;
	}

	public String getVpageType() {
		return vpageType;
	}

	public void setVpageType(String vpageType) {
		this.vpageType = vpageType;
	}

	public String getVpageCode() {
		return vpageCode;
	}

	public void setVpageCode(String vpageCode) {
		this.vpageCode = vpageCode;
	}

	public String getVurl() {
		return vurl;
	}

	public void setVurl(String vurl) {
		this.vurl = vurl;
	}
	
	public Integer getIstatus() {
		return istatus;
	}

	public void setIstatus(Integer istatus) {
		this.istatus = istatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
