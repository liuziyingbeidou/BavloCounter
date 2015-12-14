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
	// 发送容器
	private KfAccountInfo TransInfo;
	// 转接来源
	private String FromKfAccount;
	// 转接对象
	private String ToKfAccount;
	
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

	public KfAccountInfo getTransInfo() {
		return TransInfo;
	}

	public void setTransInfo(KfAccountInfo transInfo) {
		TransInfo = transInfo;
	}

	public String getToKfAccount() {
		return ToKfAccount;
	}

	public void setToKfAccount(String toKfAccount) {
		ToKfAccount = toKfAccount;
	}

	public String getFromKfAccount() {
		return FromKfAccount;
	}

	public void setFromKfAccount(String fromKfAccount) {
		FromKfAccount = fromKfAccount;
	}
}
