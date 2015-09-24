package com.bavlo.weixin.qiye.util;

import com.bavlo.weixin.qiye.enums.EnumMethod;
import com.bavlo.weixin.qiye.pojo.AccessToken;

import net.sf.json.JSONObject;

public class WechatTag {
	
	private static final String get_Tag_url = "https://qyapi.weixin.qq.com/cgi-bin/tag/list?access_token=ACCESS_TOKEN";
	
	private static final String get_TagUser_url = "https://qyapi.weixin.qq.com/cgi-bin/tag/get?access_token=ACCESS_TOKEN&tagid=TAGID";
	
	/**
	 * 根据ACCESS_TOKEN获取标签列表
	 * @return
	 */
	public static JSONObject getTagList() {
		AccessToken accessToken = QiYeUtil.getAccessToken(Constants.CORPID, Constants.SECRET);
		String TegUrl = get_Tag_url.replace("ACCESS_TOKEN", accessToken.getToken());
		JSONObject jo = HttpRequestUtil.httpRequest(TegUrl, EnumMethod.GET.name(), null);
		return jo;
	}
	
	/**
	 * 根据tagid获取成员列表
	 * @param tagid
	 * @return
	 */
	public static JSONObject getUserList(int tagid) {
		AccessToken accessToken = QiYeUtil.getAccessToken(Constants.CORPID, Constants.SECRET);
		String TegUserUrl = get_TagUser_url.replace("ACCESS_TOKEN", accessToken.getToken()).replace("TAGID", tagid + "");
		JSONObject jo = HttpRequestUtil.httpRequest(TegUserUrl, EnumMethod.GET.name(), null);
		return jo;
	}
	
}
