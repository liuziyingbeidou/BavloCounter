package com.bavlo.counter.model.order;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: OrderVO 
 * @Description: 订单VO
 * @author liuzy
 * @date 2015-10-26 下午04:22:50
 */
@Entity
@Table(name="blct_order")
public class OrderVO extends IdEntity {

	private static final long serialVersionUID = -3042708046214963717L;
	/**
	 * 客户id		bigint	
	 */
	private Integer customerId;
	@Transient
	private String customerName;
	/**
	 * 订单号		varchar(50)	
	 */
	@Column(length=50)
	private String vorderCode;	
	/**
	 * 订单状态		smallint	提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
	 */
	private Integer iorderState;
	@Transient
	private String orderState;
	/**
	 * 订单类型		varchar(10)	
	 */
	@Column(length=10)
	private String vorderType;
	/**
	 * 创建时间		varchar(30)	年月日+时分秒
	 */
	@Column(length=30)
	private String vcreateTime;
	/**
	 * 订单日期		varchar(30)	年月日
	 */
	@Column(length=30)
	private String dorderdate;	
	/**
	 * 订单说明		varchar(255)	
	 */
	@Column(length=255)
	private String vordermemo;
	/**
	 * 是否开发票		char(1)	不开发票(N),开发票(Y)
	 */
	@Column(length=1,columnDefinition="char")
	private String bisinvoice;
	/**
	 * 发票类型		bigint	基本档案(电子、纸质)
	 */
	private String vinvoiceType;
	/**
	 * 发票内容		bigint	基本档案
	 */
	private String vinvoiceContent;	
	/**
	 * 发票抬头		varchar(100)	
	 */
	@Column(length=100)
	private String vinvoiceTitle;	
	/**
	 * 交付地址id		bigint	地址档案
	 */
	private Integer addressId;
	@Transient
	private String vaddress;
	/**
	 * 收货人
	 */
	@Transient
	private String vrname;
	//联系电话
	@Transient
	private String vtel;
	//email
	@Transient
	private String vmail;
	/**
	 * 预算区间价		varchar(50)	
	 */
	@Column(length=50)
	private String vbudget;
	/**
	 * 报价		decimal(20,8)	
	 */
	@Column(precision=20,scale=8)
	private Double nquotedPrice;
	/**
	 * 已付款		decimal(20,8)	
	 */
	@Column(precision=20,scale=8)
	private Double npayment;
	/**
	 * 未付款		decimal(20,8)	
	 */
	@Column(precision=20,scale=8)
	private Double nnonPayment;
	/**
	 * 尾款实收		decimal(20,8)	
	 */
	@Column(precision=20,scale=8)
	private Double ntailPaid;
	/**
	 * 交付日期		varchar(30)	年月日
	 */
	private String ddeliverdate;
	/**
	 * 交付方式		varchar(30)	
	 */
	private String vdeliveryWay;
	/**
	 * 快递单号		varchar(50)	
	 */
	private String vcourierNumber;
	
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getVorderCode() {
		return vorderCode;
	}
	public void setVorderCode(String vorderCode) {
		this.vorderCode = vorderCode;
	}
	public Integer getIorderState() {
		return iorderState;
	}
	public void setIorderState(Integer iorderState) {
		this.iorderState = iorderState;
	}
	public String getVorderType() {
		return vorderType;
	}
	public void setVorderType(String vorderType) {
		this.vorderType = vorderType;
	}
	public String getVcreateTime() {
		return vcreateTime;
	}
	public void setVcreateTime(String vcreateTime) {
		this.vcreateTime = vcreateTime;
	}
	public String getDorderdate() {
		return dorderdate;
	}
	public void setDorderdate(String dorderdate) {
		this.dorderdate = dorderdate;
	}
	public String getVordermemo() {
		return vordermemo;
	}
	public void setVordermemo(String vordermemo) {
		this.vordermemo = vordermemo;
	}
	public String getBisinvoice() {
		return bisinvoice;
	}
	public void setBisinvoice(String bisinvoice) {
		this.bisinvoice = bisinvoice;
	}
	public String getVinvoiceType() {
		return vinvoiceType;
	}
	public void setVinvoiceType(String vinvoiceType) {
		this.vinvoiceType = vinvoiceType;
	}
	public String getVinvoiceContent() {
		return vinvoiceContent;
	}
	public void setVinvoiceContent(String vinvoiceContent) {
		this.vinvoiceContent = vinvoiceContent;
	}
	public String getVinvoiceTitle() {
		return vinvoiceTitle;
	}
	public void setVinvoiceTitle(String vinvoiceTitle) {
		this.vinvoiceTitle = vinvoiceTitle;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public String getVbudget() {
		return vbudget;
	}
	public void setVbudget(String vbudget) {
		this.vbudget = vbudget;
	}
	public Double getNquotedPrice() {
		return nquotedPrice;
	}
	public void setNquotedPrice(Double nquotedPrice) {
		this.nquotedPrice = nquotedPrice;
	}
	public Double getNpayment() {
		return npayment;
	}
	public void setNpayment(Double npayment) {
		this.npayment = npayment;
	}
	public Double getNnonPayment() {
		return nnonPayment;
	}
	public void setNnonPayment(Double nnonPayment) {
		this.nnonPayment = nnonPayment;
	}
	public Double getNtailPaid() {
		return ntailPaid;
	}
	public void setNtailPaid(Double ntailPaid) {
		this.ntailPaid = ntailPaid;
	}
	public String getDdeliverdate() {
		return ddeliverdate;
	}
	public void setDdeliverdate(String ddeliverdate) {
		this.ddeliverdate = ddeliverdate;
	}
	public String getVdeliveryWay() {
		return vdeliveryWay;
	}
	public void setVdeliveryWay(String vdeliveryWay) {
		this.vdeliveryWay = vdeliveryWay;
	}
	public String getVcourierNumber() {
		return vcourierNumber;
	}
	public void setVcourierNumber(String vcourierNumber) {
		this.vcourierNumber = vcourierNumber;
	}
	public String getVaddress() {
		return vaddress;
	}
	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getVrname() {
		return vrname;
	}
	public void setVrname(String vrname) {
		this.vrname = vrname;
	}
	public String getVtel() {
		return vtel;
	}
	public void setVtel(String vtel) {
		this.vtel = vtel;
	}
	public String getVmail() {
		return vmail;
	}
	public void setVmail(String vmail) {
		this.vmail = vmail;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	
}
