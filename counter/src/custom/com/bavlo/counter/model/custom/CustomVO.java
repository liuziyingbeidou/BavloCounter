package com.bavlo.counter.model.custom;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomVO
 * @Description: 定制单实体类
 * @author shijf
 * @date 2015-10-28 下午06:43:28
 */
@Entity
@Table(name = "blct_custom")
public class CustomVO extends IdEntity {

	private static final long serialVersionUID = 1L;
	/**
	 * 用户ID
	 */
	private Long customerId;
	/**
	 * 定制单编号
	 */
	@Column(length = 50)
	private String vcustomCode;
	/**
	 * 款式类型
	 */
	@Column(length = 50)
	private String srcstyleType;
	/**
	 * 链子
	 */
	@Column(length = 50)
	private String srcchain;
	/**
	 * 金属
	 */
	@Column(length = 50)
	private String srcmetail;
	/**
	 * 戒指手寸
	 */
	@Column(length = 50)
	private String srcringSize;
	/**
	 * 款式名称
	 */
	@Column(length = 50)
	private String vstyleName;
	/**
	 * 款式性别
	 */
	@Column(length = 50)
	private String vsex;
	/**
	 * 重量	
	 */
	@Column(precision=20,scale=8)
	private Double nweight;
	/**
	 * 价格
	 */
	@Column(precision = 20, scale = 8)
	private Double iprice;
	/**
	 * 其他款项
	 */
	@Column(precision = 20, scale = 8)
	private Double notherPrice;
	/**
	 * 刻字
	 */
	@Column(length = 50)
	private String vengrave;
	/**
	 * 刻字字体
	 */
	@Column(length = 50)
	private String vfont;
	/**
	 * 定制单创建时间
	 */
	@Column(length = 50)
	private String vcreatedate;
	/**
	 * 状态:0:未处理；1：设计中；2：已完成
	 */
	private Integer istatus;
	/**
	 * 需求描述
	 */
	private String vrequirement;
	/**
	 * 细节描述
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

	public Double getIprice() {
		return iprice;
	}

	public void setIprice(Double iprice) {
		this.iprice = iprice;
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

}
