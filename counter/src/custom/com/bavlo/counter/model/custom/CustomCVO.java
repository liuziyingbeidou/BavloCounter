package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: CustomCVO
 * @Description: ʵ��ǩ�յ��ӱ����ӣ�
 * @author shijf
 * @date 2015-11-9 ����07:21:21
 */
@Entity
@Table(name = "blct_custom_c")
public class CustomCVO extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 * ��������
	 */
	private Integer customId;
	/**
	 * ��������
	 */
	private Integer srcchainId;
	/**
	 * ��������
	 */
	private String vchainName;
	/**
	 * ���Ӳ���
	 */
	private String vchainMetal;
	/**
	 * ���ӹ��
	 */
	private String vchainSize;
	/**
	 * ���Ӽ۸�
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
