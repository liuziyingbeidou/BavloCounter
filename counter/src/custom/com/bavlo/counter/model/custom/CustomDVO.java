package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomDVO
 * @Description: 定制单子表（库选石）
 * @author shijf
 * @date 2015-11-9 下午07:21:21
 */
@Entity
@Table(name = "blct_custom_D")
public class CustomDVO extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 * 主表主键
	 */
	private Integer customId;
	/**
	 * 库选石名称
	 */
	private String vstockGemName;
	/**
	 * 库选石数量
	 */
	private Integer istockGemNum;
	/**
	 * 库选石图片路径
	 */
	private String vstockGemImgPath;
	/**
	 * 库选石价格
	 */
	private BigDecimal nstockGemCost;

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public String getVstockGemName() {
		return vstockGemName;
	}

	public void setVstockGemName(String vstockGemName) {
		this.vstockGemName = vstockGemName;
	}

	public Integer getIstockGemNum() {
		return istockGemNum;
	}

	public void setIstockGemNum(Integer istockGemNum) {
		this.istockGemNum = istockGemNum;
	}

	public String getVstockGemImgPath() {
		return vstockGemImgPath;
	}

	public void setVstockGemImgPath(String vstockGemImgPath) {
		this.vstockGemImgPath = vstockGemImgPath;
	}

	public BigDecimal getNstockGemCost() {
		return nstockGemCost;
	}

	public void setNstockGemCost(BigDecimal nstockGemCost) {
		this.nstockGemCost = nstockGemCost;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
