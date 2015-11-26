package com.bavlo.counter.model.custom;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: CustomDVO
 * @Description: ���Ƶ��ӱ���ѡʯ��
 * @author shijf
 * @date 2015-11-9 ����07:21:21
 */
@Entity
@Table(name = "blct_custom_D")
public class CustomDVO extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 * ��������
	 */
	private Integer customId;
	/**
	 * ��ѡʯ����
	 */
	private String vstockGemName;
	/**
	 * ��ѡʯ����
	 */
	private Integer istockGemNum;
	/**
	 * ��ѡʯͼƬ·��
	 */
	private String vstockGemImgPath;
	/**
	 * ��ѡʯ�۸�
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
