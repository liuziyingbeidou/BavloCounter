package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomCVO
 * @Description: 款式单子表（链子）
 * @author shijf
 * @date 2015-11-9 下午07:21:21
 */
@Entity
@Table(name = "blct_custom_c")
public class CustomCVO extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 * 主表主键
	 */
	private Integer customId;
	/**
	 * 链子名称
	 */
	private String vchainName;
	/**
	 * 链子数量
	 */
	private Integer ichainItem;
	/**
	 * 链子价格
	 */
	private BigDecimal nchainCost;

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public String getVchainName() {
		return vchainName;
	}

	public void setVchainName(String vchainName) {
		this.vchainName = vchainName;
	}

	public Integer getIchainItem() {
		return ichainItem;
	}

	public void setIchainItem(Integer ichainItem) {
		this.ichainItem = ichainItem;
	}

	public BigDecimal getNchainCost() {
		return nchainCost;
	}

	public void setNchainCost(BigDecimal nchainCost) {
		this.nchainCost = nchainCost;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
