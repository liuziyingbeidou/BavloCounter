package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomDVO
 * @Description: 实物签收单子表（库选石）
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
	 * 宝石主键
	 */
	private Integer srcgemId;
	/**
	 * 库选石名称
	 */
	private String vgemName;
	/**
	 * 库选石形状
	 */
	private String vgemShape;
	/**
	 * 库选石规格
	 */
	private String vgemSize;
	/**
	 * 库选石图片路径
	 */
	private String vgemImgPath;
	/**
	 * 库选石价格
	 */
	private BigDecimal vgemCost;

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public Integer getSrcgemId() {
		return srcgemId;
	}

	public void setSrcgemId(Integer srcgemId) {
		this.srcgemId = srcgemId;
	}

	public String getVgemName() {
		return vgemName;
	}

	public void setVgemName(String vgemName) {
		this.vgemName = vgemName;
	}

	public String getVgemShape() {
		return vgemShape;
	}

	public void setVgemShape(String vgemShape) {
		this.vgemShape = vgemShape;
	}

	public String getVgemSize() {
		return vgemSize;
	}

	public void setVgemSize(String vgemSize) {
		this.vgemSize = vgemSize;
	}

	public String getVgemImgPath() {
		return vgemImgPath;
	}

	public void setVgemImgPath(String vgemImgPath) {
		this.vgemImgPath = vgemImgPath;
	}

	public BigDecimal getVgemCost() {
		return vgemCost;
	}

	public void setVgemCost(BigDecimal vgemCost) {
		this.vgemCost = vgemCost;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
