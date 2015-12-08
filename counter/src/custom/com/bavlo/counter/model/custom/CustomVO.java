package com.bavlo.counter.model.custom;

import java.math.BigDecimal;
import java.util.Date;

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
	private Integer customerId;
	/**
	 * 定制单编号
	 */
	private String vcustomCode;
	/**
	 * 款式类型
	 */
	private String srcstyleType;
	/**
	 * 金属
	 */
	private String srcmetal;
	/**
	 * 戒指手寸
	 */
	private String srcringSize;
	/**
	 * 款式名称
	 */
	private String vstyleName;
	/**
	 * 款式性别
	 */
	private String vsex;
	/**
	 * 重量
	 */
	private Double nweight;
	/**
	 * 主石（元）
	 */
	private BigDecimal nmainGemCost;
	/**
	 * 主石（名字）
	 */
	private String vmainGemName;
	/**
	 * 主石（图片地址）
	 */
	private String vmainGemPic;
	/**
	 * 配石（颗）
	 */
	private Integer ipartsGemNum;
	/**
	 * 配石（名字）
	 */
	private String vpartsGemName;
	/**
	 * 配石（图片地址）
	 */
	private String vpartsGemPic;
	/**
	 * 其他款项
	 */
	private BigDecimal npmPrice;
	/**
	 * 其他款项
	 */
	private BigDecimal notherPrice;
	/**
	 * 总价格
	 */
	private BigDecimal nprice;
	/**
	 * 刻字
	 */
	private String vengrave;
	/**
	 * 刻字矢量图
	 */
	private String vengraveVh;
	/**
	 * 刻字字体
	 */
	private String vfont;
	/**
	 * CAD文件
	 */
	private String vcadFile;
	/**
	 * 定制单创建时间
	 */
	private Date vcreatedate;
	/**
	 * 状态:0:未处理；1：设计中；2：已完成
	 */
	private Integer istatus;
	/**
	 * 鉴定证书:0:无；1：有
	 */
	private Integer icertificate;
	/**
	 * 需求描述
	 */
	private String vrequirement;
	/**
	 * 工艺标签
	 */
	private String vcraftTag;
	/**
	 * 工艺细节描述
	 */
	private String vrequirementB;
	/**
	 * 订单ID
	 */
	private Integer orderId;
	/**
	 * 订单编号
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

	public BigDecimal getNmainGemCost() {
		return nmainGemCost;
	}

	public void setNmainGemCost(BigDecimal nmainGemCost) {
		this.nmainGemCost = nmainGemCost;
	}

	public String getVmainGemName() {
		return vmainGemName;
	}

	public void setVmainGemName(String vmainGemName) {
		this.vmainGemName = vmainGemName;
	}

	public String getVmainGemPic() {
		return vmainGemPic;
	}

	public void setVmainGemPic(String vmainGemPic) {
		this.vmainGemPic = vmainGemPic;
	}

	public Integer getIpartsGemNum() {
		return ipartsGemNum;
	}

	public void setIpartsGemNum(Integer ipartsGemNum) {
		this.ipartsGemNum = ipartsGemNum;
	}

	public String getVpartsGemName() {
		return vpartsGemName;
	}

	public void setVpartsGemName(String vpartsGemName) {
		this.vpartsGemName = vpartsGemName;
	}

	public String getVpartsGemPic() {
		return vpartsGemPic;
	}

	public void setVpartsGemPic(String vpartsGemPic) {
		this.vpartsGemPic = vpartsGemPic;
	}

	public BigDecimal getNpmPrice() {
		return npmPrice;
	}

	public void setNpmPrice(BigDecimal npmPrice) {
		this.npmPrice = npmPrice;
	}

	public BigDecimal getNotherPrice() {
		return notherPrice;
	}

	public void setNotherPrice(BigDecimal notherPrice) {
		this.notherPrice = notherPrice;
	}

	public BigDecimal getNprice() {
		return nprice;
	}

	public void setNprice(BigDecimal nprice) {
		this.nprice = nprice;
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

}
