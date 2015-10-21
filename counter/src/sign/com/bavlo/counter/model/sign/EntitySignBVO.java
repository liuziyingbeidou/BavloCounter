package com.bavlo.counter.model.sign;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: SignBVO 
 * @Description: ʵ��ǩ�յ��ӱ�ͼƬ��
 * @author liuzy
 * @date 2015-10-19 ����07:21:21
 */
@Entity
@Table(name="blct_entitysign_b")
public class EntitySignBVO extends IdEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * ��������		longint	
	 */
	private Long entitysignId;
	/**
	 * ʵ������		varchar(100)	
	 */
	private String vname;
	/**
	 * ʵ��·��		varchar(100)	
	 */
	private String vpath;
	
	public Long getEntitysignId() {
		return entitysignId;
	}
	public void setEntitysignId(Long entitysignId) {
		this.entitysignId = entitysignId;
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
	
}
