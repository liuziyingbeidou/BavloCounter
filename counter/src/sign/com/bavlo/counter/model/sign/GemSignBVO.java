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
@Table(name="blct_gemsign_b")
public class GemSignBVO extends IdEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * ��������		longint	
	 */
	private Integer gemsignId;
	/**
	 * ʵ������		varchar(100)	
	 */
	private String vname;
	/**
	 * ʵ��·��		varchar(100)	
	 */
	private String vpath;
	
	/**
	 * �Ƿ����		char(1)	Y��N
	 */
	private String biscover;
	
	public Integer getGemsignId() {
		return gemsignId;
	}
	public void setGemsignId(Integer gemsignId) {
		this.gemsignId = gemsignId;
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
	
}
