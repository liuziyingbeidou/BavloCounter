package com.bavlo.weixin.fuwu.message.resp;

/**
 * 转发到多客服消息
 * 
 * @author shijf
 */
public class ForwardMessage extends BaseMessage {
	
	// 指定会话接入的客服账号
	private String KfAccount;
	// 回复的消息内容
	private String Content;
	
	public String getKfAccount() {
		return KfAccount;
	}
	
	public void setKfAccount(String kfAccount) {
		KfAccount = kfAccount;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
