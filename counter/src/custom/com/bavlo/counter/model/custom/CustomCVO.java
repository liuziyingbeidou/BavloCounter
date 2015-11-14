package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomCVO
 * @Description: 实物签收单子表（链子）
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
	 * 链子主键
	 */
	private Integer srcchainId;
	/**
	 * 链子名称
	 */
	private String vchainName;
	/**
	 * 链子材质
	 */
	private String vchainMetal;
	/**
	 * 链子规格
	 */
	private String vchainSize;
	/**
	 * 链子价格
	 */
	private BigDecimal vchainCost;

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public Integer getSrcchainId() {
		return srcchainId;
	}

	public void setSrcchainId(Integer srcchainId) {
		this.srcchainId = srcchainId;
	}

	public String getVchainName() {
		return vchainName;
	}

	public void setVchainName(String vchainName) {
		this.vchainName = vchainName;
	}

	public String getVchainMetal() {
		return vchainMetal;
	}

	public void setVchainMetal(String vchainMetal) {
		this.vchainMetal = vchainMetal;
	}

	public String getVchainSize() {
		return vchainSize;
	}

	public void setVchainSize(String vchainSize) {
		this.vchainSize = vchainSize;
	}

	public BigDecimal getVchainCost() {
		return vchainCost;
	}

	public void setVchainCost(BigDecimal vchainCost) {
		this.vchainCost = vchainCost;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
