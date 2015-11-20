package com.bavlo.counter.model.custom;

import java.math.BigDecimal;
import java.util.Date;

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
	private Integer customerId;
	/**
	 * ���Ƶ����
	 */
	private String vcustomCode;
	/**
	 * ��ʽ����
	 */
	private String srcstyleType;
	/**
	 * ����
	 */
	private String srcmetal;
	/**
	 * ��ָ�ִ�
	 */
	private String srcringSize;
	/**
	 * ��ʽ����
	 */
	private String vstyleName;
	/**
	 * ��ʽ�Ա�
	 */
	private String vsex;
	/**
	 * ����
	 */
	private Double nweight;
	/**
	 * ��ʯ��Ԫ��
	 */
	private BigDecimal nprimaryGemCost;
	/**
	 * ��ʯ��ID��
	 */
	private Integer iprimaryGemID;
	/**
	 * ��ʯ���ţ�
	 */
	private Integer iforeignGemNum;
	/**
	 * ��ʯ��ID��
	 */
	private Integer iforeignGemID;
	/**
	 * ��������
	 */
	private BigDecimal npmPrice;
	/**
	 * ��������
	 */
	private BigDecimal notherPrice;
	/**
	 * �ܼ۸�
	 */
	private BigDecimal nprice;
	/**
	 * ����
	 */
	private String vengrave;
	/**
	 * ����ʸ��ͼ
	 */
	private String vengraveVh;
	/**
	 * ��������
	 */
	private String vfont;
	/**
	 * CAD�ļ�
	 */
	private String vcadFile;
	/**
	 * ���Ƶ�����ʱ��
	 */
	private Date vcreatedate;
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
	 * ���ձ�ǩ
	 */
	private String vcraftTag;
	/**
	 * ����ϸ������
	 */
	private String vrequirementB;
	/**
	 * ����ID
	 */
	private Integer orderId;
	/**
	 * �������
	 */
	private String vorderCode;

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
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

	public String getSrcmetal() {
		return srcmetal;
	}

	public void setSrcmetal(String srcmetal) {
		this.srcmetal = srcmetal;
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

	public BigDecimal getNprimaryGemCost() {
		return nprimaryGemCost;
	}

	public void setNprimaryGemCost(BigDecimal nprimaryGemCost) {
		this.nprimaryGemCost = nprimaryGemCost;
	}

	public Integer getIprimaryGemID() {
		return iprimaryGemID;
	}

	public void setIprimaryGemID(Integer iprimaryGemID) {
		this.iprimaryGemID = iprimaryGemID;
	}

	public Integer getIforeignGemNum() {
		return iforeignGemNum;
	}

	public void setIforeignGemNum(Integer iforeignGemNum) {
		this.iforeignGemNum = iforeignGemNum;
	}

	public Integer getIforeignGemID() {
		return iforeignGemID;
	}

	public void setIforeignGemID(Integer iforeignGemID) {
		this.iforeignGemID = iforeignGemID;
	}

	public BigDecimal getNprice() {
		return nprice;
	}

	public void setNprice(BigDecimal nprice) {
		this.nprice = nprice;
	}

	public BigDecimal getNotherPrice() {
		return notherPrice;
	}

	public void setNotherPrice(BigDecimal notherPrice) {
		this.notherPrice = notherPrice;
	}

	public String getVengrave() {
		return vengrave;
	}

	public void setVengrave(String vengrave) {
		this.vengrave = vengrave;
	}

	public String getVengraveVh() {
		return vengraveVh;
	}

	public void setVengraveVh(String vengraveVh) {
		this.vengraveVh = vengraveVh;
	}

	public String getVfont() {
		return vfont;
	}

	public void setVfont(String vfont) {
		this.vfont = vfont;
	}

	public String getVcadFile() {
		return vcadFile;
	}

	public void setVcadFile(String vcadFile) {
		this.vcadFile = vcadFile;
	}

	public Date getVcreatedate() {
		return vcreatedate;
	}

	public void setVcreatedate(Date vcreatedate) {
		this.vcreatedate = vcreatedate;
	}

	public Integer getIstatus() {
		return istatus;
	}

	public void setIstatus(Integer istatus) {
		this.istatus = istatus;
	}

	public Integer getIcertificate() {
		return icertificate;
	}

	public void setIcertificate(Integer icertificate) {
		this.icertificate = icertificate;
	}

	public String getVrequirement() {
		return vrequirement;
	}

	public void setVrequirement(String vrequirement) {
		this.vrequirement = vrequirement;
	}

	public String getVcraftTag() {
		return vcraftTag;
	}

	public void setVcraftTag(String vcraftTag) {
		this.vcraftTag = vcraftTag;
	}

	public String getVrequirementB() {
		return vrequirementB;
	}

	public void setVrequirementB(String vrequirementB) {
		this.vrequirementB = vrequirementB;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getVorderCode() {
		return vorderCode;
	}

	public void setVorderCode(String vorderCode) {
		this.vorderCode = vorderCode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public BigDecimal getNpmPrice() {
		return npmPrice;
	}

	public void setNpmPrice(BigDecimal npmPrice) {
		this.npmPrice = npmPrice;
	}

}
