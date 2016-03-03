package com.bavlo.counter.model.manage.tools;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bavlo.counter.model.IdEntity;

/**
 * @Title: ����Counter
 * @ClassName: SharePic 
 * @Description: �����Դ� ����ͼƬ ��ʱ��
 * @author liuzy
 * @date 2016-3-2 ����02:36:19
 */
@Entity
@Table(name="blct_sharepic")
public class SharePicVO extends IdEntity {

	private static final long serialVersionUID = -5697652202872800039L;
	
	//����ͼƬURL
	private String url;
	//��ʽID
	private String kId;
	
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
	
}
