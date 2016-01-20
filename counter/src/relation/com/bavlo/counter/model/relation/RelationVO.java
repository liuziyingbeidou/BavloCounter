package com.bavlo.counter.model.relation;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: RelationVO
 * @Description: ����ʵ����
 * @author shijf
 * @date 2016��1��11�� ����11:19:23
 */
@Entity
@Table(name = "blct_relation")
public class RelationVO extends IdEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * ������
	 */
	private String vfromUser;
	/**
	 * ������
	 */
	private String vtoUser;
	/**
	 * ҳ������
	 */
	private String vpageType;
	/**
	 * ҳ����
	 */
	private String vpageCode;
	/**
	 * ���͵�����
	 */
	private String vurl;
	/**
	 * ״̬ 0.δ�� 1.�Ѷ�
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
