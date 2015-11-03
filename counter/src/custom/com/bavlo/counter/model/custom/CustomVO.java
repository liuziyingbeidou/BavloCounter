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
	 * ��ʽ����
	 */
	@Column(length = 50)
	private String srcstyleType;
	/**
	 * ����
	 */
	@Column(length = 50)
	private String srcchain;
	/**
	 * ����
	 */
	@Column(length = 50)
	private String srcmetail;
	/**
	 * ��ָ�ִ�
	 */
	@Column(length = 50)
	private String srcringSize;
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
	 * ����	
	 */
	@Column(precision=20,scale=8)
	private Double nweight;
	/**
	 * ��ʯ��Ԫ��
	 */
	@Column(precision = 20, scale = 8)
	private Double nprimaryGem;
	/**
	 * ��ʯ���ţ�
	 */
	private Integer iforeignGem;
	/**
	 * �۸�
	 */
	@Column(precision = 20, scale = 8)
	private Double nprice;
	/**
	 * ��������
	 */
	@Column(precision = 20, scale = 8)
	private Double notherPrice;
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
	 * ����֤��:0:�ޣ�1����
	 */
	private Integer icertificate;
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

	public String getVcustomCode() {
		return vcustomCode;
	}

	public void setVcustomCode(String vcustomCode) {
		this.vcustomCode = vcustomCode;
	}

	public String getSrcstyleType() {
		return srcstyleType;
	}

	public void setSrcstyleType(String srcstyleType) {
		this.srcstyleType = srcstyleType;
	}

	public String getSrcchain() {
		return srcchain;
	}

	public void setSrcchain(String srcchain) {
		this.srcchain = srcchain;
	}

	public String getSrcmetail() {
		return srcmetail;
	}

	public void setSrcmetail(String srcmetail) {
		this.srcmetail = srcmetail;
	}

	public String getSrcringSize() {
		return srcringSize;
	}

	public void setSrcringSize(String srcringSize) {
		this.srcringSize = srcringSize;
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

	public Double getNweight() {
		return nweight;
	}

	public void setNweight(Double nweight) {
		this.nweight = nweight;
	}
	public Double getNprimaryGem() {
		return nprimaryGem;
	}

	public void setNprimaryGem(Double nprimaryGem) {
		this.nprimaryGem = nprimaryGem;
	}

	public Integer getIforeignGem() {
		return iforeignGem;
	}

	public void setIforeignGem(Integer iforeignGem) {
		this.iforeignGem = iforeignGem;
	}

	public Double getNprice() {
		return nprice;
	}

	public void setINprice(Double nprice) {
		this.nprice = nprice;
	}

	public Double getNotherPrice() {
		return notherPrice;
	}

	public void setNotherPrice(Double notherPrice) {
		this.notherPrice = notherPrice;
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

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public Integer getIcertificate() {
		return icertificate;
	}

	public void setIcertificate(Integer icertificate) {
		this.icertificate = icertificate;
	}

}
