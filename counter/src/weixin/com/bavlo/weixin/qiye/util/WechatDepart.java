package com.bavlo.weixin.qiye.util;

import com.bavlo.weixin.qiye.enums.EnumMethod;
import com.bavlo.weixin.qiye.pojo.AccessToken;

import net.sf.json.JSONObject;

/**
 * @Title: 宝珑Counter
 * @ClassName: WechatDepart 
 * @Description: 部门管理相关接口实现
 * @author liuzy
 * @date 2015-11-18 下午05:25:16
 */
public class WechatDepart {
	
	
	private static final String get_DepartUser_url = "https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&userid=USERID";
	
	
	/**
	 * 根据userId获取成员详细信息
	 * 管理组须拥有指定成员的查看权限
	 * @param userId
	 * @return
	 */
	public static JSONObject getUserInfo(String userId) {
		AccessToken accessToken = QiYeUtil.getAccessToken(Constants.CORPID, Constants.SECRET);
		String TegUserUrl = get_DepartUser_url.replace("ACCESS_TOKEN", accessToken.getToken()).replace("USERID", userId + "");
		JSONObject jo = HttpRequestUtil.httpRequest(TegUserUrl, EnumMethod.GET.name(), null);
		return jo;
	}
	
}
