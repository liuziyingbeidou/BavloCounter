package com.bavlo.weixin.qiye.util;

import com.bavlo.weixin.qiye.pojo.AccessToken;
import com.bavlo.weixin.qiye.pojo.resp.TextMessage;
import com.bavlo.weixin.qiye.util.Constants;
import com.bavlo.weixin.qiye.util.QiYeUtil;

public class WechatSendMessage {
	// 发送接口
	public static String POST_URL = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=ACCESS_TOKEN";

	/**
	 * text消息
	 * 
	 * @param touser
	 *            UserID列表（消息接收者，多个接收者用‘|’分隔）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送————
	 *            "touser": "UserID1|UserID2|UserID3"
	 * @param toparty
	 *            PartyID列表，多个接受者用‘|’分隔。当touser为@all时忽略本参数————"toparty":
	 *            " PartyID1 | PartyID2 "
	 * @param totag
	 *            TagID列表，多个接受者用‘|’分隔。当touser为@all时忽略本参数————"totag":
	 *            " TagID1 | TagID2 "
	 * @param msgtype
	 *            消息类型，此时固定为：text
	 * @param agentid
	 *            企业应用的id，整型。可在应用的设置页面查看
	 * @param content
	 *            消息内容
	 * @param safe
	 *            表示是否是保密消息，0表示否，1表示是，默认0
	 * */
	public static String STextMsg(String touser, String toparty, String totag,
			String agentid, String text) {
		String PostData = "{\"touser\": \"%s\",\"toparty\": \"%s\",\"totag\": \"%s\",\"msgtype\": \"text\",\"agentid\": \"%s\",\"text\": {\"content\": \"%s\"},\"safe\":\"0\"}";
		return String.format(PostData, touser, toparty, totag, agentid, text);
	}

	// 发送消息测试
	public static int sendMassage(String touser, String toparty, String totag,
			String agentid, String text) {
		// 调取凭证
		AccessToken access_token = QiYeUtil.getAccessToken(Constants.CORPID,
				Constants.SECRET);

		/**
		 * 发送text文本消息
		 * 
		 * 
		 */
		// String touser = "shijianfeng";
		// String toparty = "@all";
		// String totag = "@all";
		// String agentid = "13";
		// TextMessage text = new TextMessage();
		// text.setContent("你好，你有新的任务，请点击\n m.bavlo.com \n查看");
		String PostData = STextMsg(touser, toparty, totag, agentid, text);
		System.out.println(access_token.getToken());
		System.out.println(PostData);
		int result = QiYeUtil.PostMessage(access_token, "POST", POST_URL,
				PostData);

		return result;
	}
}
