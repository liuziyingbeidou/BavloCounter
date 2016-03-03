package com.bavlo.weixin.fuwu.message.req;

/**
 * 图片消息
 * 
 * @author shijf
 */
public class ImageMessage extends BaseMessage {
	// 图片链接
	private String PicUrl;
	private Integer MediaId;

	public Integer getMediaId() {
		return MediaId;
	}

	public void setMediaId(Integer mediaId) {
		MediaId = mediaId;
	}

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
}
