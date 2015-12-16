package com.bavlo.counter.model.custom;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: CustomBVO 
 * @Description: ʵ��ǩ�յ��ӱ�ͼƬ��
 * @author shijf
 * @date 2015-11-9 ����07:21:21
 */
@Entity
@Table(name="blct_custom_b")
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
	
	/**
	 * ͼƬ����
	 */
	private String vtype;

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

	public String getVtype() {
		return vtype;
	}

	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	
}
