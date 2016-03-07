package com.bavlo.counter.model.manage.tools;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: 宝珑Counter
 * @ClassName: SharePic 
 * @Description: 虚拟试戴 分享图片 临时表
 * @author liuzy
 * @date 2016-3-2 下午02:36:19
 */
@Entity
@Table(name="blct_sharepic")
public class SharePicVO extends IdEntity {

	private static final long serialVersionUID = -5697652202872800039L;
	
	//分享图片URL
	private String url;
	//款式ID
	private String kId;
	//是否关闭/删除二维码
	private String bisClose;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getkId() {
		return kId;
	}

	public void setkId(String kId) {
		this.kId = kId;
	}

	public String getBisClose() {
		return bisClose;
	}

	public void setBisClose(String bisClose) {
		this.bisClose = bisClose;
	}
	
}
