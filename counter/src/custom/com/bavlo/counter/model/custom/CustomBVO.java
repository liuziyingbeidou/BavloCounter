package com.bavlo.counter.model.custom;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: CustomImgVO 
 * @Description: ʵ��ǩ�յ��ӱ�ͼƬ��
 * @author shijf
 * @date 2015-11-9 ����07:21:21
 */
@Entity
@Table(name="blct_custom_img")
public class CustomBVO extends IdEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * ��������		longint	
	 */
	private Integer customId;
	/**
	 * ͼƬ��			varchar(100)	
	 */
	private String vname;
	/**
	 * ͼƬ·��		varchar(100)	
	 */
	private String vpath;
	
	/**
	 * �Ƿ����		char(1)	Y��N
	 */
	private String biscover;

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

	public String getBiscover() {
		return biscover;
	}

	public void setBiscover(String biscover) {
		this.biscover = biscover;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
