package com.bavlo.counter.model.custom;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: CustomImgVO 
 * @Description: 实物签收单子表（文件）
 * @author shijf
 * @date 2015-11-9 下午07:21:21
 */
@Entity
@Table(name="blct_custom_c")
public class CustomCVO extends IdEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * 主表主键		longint	
	 */
	private Integer customId;
	/**
	 * 文件名			varchar(100)	
	 */
	private String vname;
	/**
	 * 文件路径		varchar(100)	
	 */
	private String vpath;

	public Integer getCustomId() {
		return customId;
	}

	public void setCustomId(Integer customId) {
		this.customId = customId;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVpath() {
		return vpath;
	}

	public void setVpath(String vpath) {
		this.vpath = vpath;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
