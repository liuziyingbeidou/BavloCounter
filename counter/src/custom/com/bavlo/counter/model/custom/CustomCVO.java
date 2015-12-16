package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: CustomCVO
 * @Description: ��ʽ���ӱ����ӣ�
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
	private String vchainName;
	/**
	 * ��������
	 */
	private Integer ichainItem;
	/**
	 * ���Ӽ۸�
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
