package com.bavlo.counter.model.custom;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: CustomVO
 * @Description: ���Ƶ�ʵ����
 * @author shijf
 * @date 2015-10-28 ����06:43:28
 */
@Entity
@Table(name = "blct_custom")
public class CustomVO extends IdEntity {

	private static final long serialVersionUID = 1L;
	/**
	 * �û�ID
	 */
	private Long customerId;
	/**
	 * ���Ƶ����
	 */
	@Column(length = 50)
	private String vcustomCode;
	/**
	 * ��ʽ����ID
	 */
	private Long srcstyleTypeId;
	/**
	 * ����ID
	 */
	private Long srcchainId;
	/**
	 * ����ID
	 */
	private Long srcmetailId;
	/**
	 * ��ָ�ִ�
	 */
	@Column(length = 50)
	private String vringSize;
	/**
	 * ��ʽ����
	 */
	@Column(length = 50)
	private String vstyleName;
	/**
	 * ��ʽ�Ա�
	 */
	@Column(length = 50)
	private String vsex;
	/**
	 * �۸�
	 */
	@Column(precision = 20, scale = 8)
	private Double iprice;
	/**
	 * ��������
	 */
	@Column(precision = 20, scale = 8)
	private Double iotherPrice;
	/**
	 * ����
	 */
	@Column(length = 50)
	private String vengrave;
	/**
	 * ��������
	 */
	@Column(length = 50)
	private String vfont;
	/**
	 * ���Ƶ�����ʱ��
	 */
	@Column(length = 50)
	private String vcreatedate;
	/**
	 * ״̬:0:δ����1������У�2�������
	 */
	private Integer istatus;
	/**
	 * ��������
	 */
	private String vrequirement;
	/**
	 * ϸ������
	 */
	private String vrequirementB;

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getVcustomCode() {
		return vcustomCode;
	}

	public void setVcustomCode(String vcustomCode) {
		this.vcustomCode = vcustomCode;
	}

	public Long getSrcstyleTypeId() {
		return srcstyleTypeId;
	}

	public void setSrcstyleTypeId(Long srcstyleTypeId) {
		this.srcstyleTypeId = srcstyleTypeId;
	}

	public Long getSrcchainId() {
		return srcchainId;
	}

	public void setSrcchainId(Long srcchainId) {
		this.srcchainId = srcchainId;
	}

	public Long getSrcmetailId() {
		return srcmetailId;
	}

	public void setSrcmetailId(Long srcmetailId) {
		this.srcmetailId = srcmetailId;
	}

	public String getVringSize() {
		return vringSize;
	}

	public void setVringSize(String vringSize) {
		this.vringSize = vringSize;
	}

	public String getVstyleName() {
		return vstyleName;
	}

	public void setVstyleName(String vstyleName) {
		this.vstyleName = vstyleName;
	}

	public String getVsex() {
		return vsex;
	}

	public void setVsex(String vsex) {
		this.vsex = vsex;
	}

	public Double getIprice() {
		return iprice;
	}

	public void setIprice(Double iprice) {
		this.iprice = iprice;
	}

	public Double getIotherPrice() {
		return iotherPrice;
	}

	public void setIotherPrice(Double iotherPrice) {
		this.iotherPrice = iotherPrice;
	}

	public String getVengrave() {
		return vengrave;
	}

	public void setVengrave(String vengrave) {
		this.vengrave = vengrave;
	}

	public String getVfont() {
		return vfont;
	}

	public void setVfont(String vfont) {
		this.vfont = vfont;
	}

	public String getVcreatedate() {
		return vcreatedate;
	}

	public void setVcreatedate(String vcreatedate) {
		this.vcreatedate = vcreatedate;
	}

	public Integer getIstatus() {
		return istatus;
	}

	public void setIstatus(Integer istatus) {
		this.istatus = istatus;
	}

	public String getVrequirement() {
		return vrequirement;
	}

	public void setVrequirement(String vrequirement) {
		this.vrequirement = vrequirement;
	}

	public String getVrequirementB() {
		return vrequirementB;
	}

	public void setVrequirementB(String vrequirementB) {
		this.vrequirementB = vrequirementB;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
