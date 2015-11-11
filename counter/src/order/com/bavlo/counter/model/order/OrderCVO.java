package com.bavlo.counter.model.order;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: OrderCVO 
 * @Description: �����ӱ�ͼƬ��
 * @author liuzy
 * @date 2015-10-19 ����07:21:21
 */
@Entity
@Table(name="blct_order_c")
public class OrderCVO extends IdEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * ��������		longint	
	 */
	private Integer orderId;
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
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
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
