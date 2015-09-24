package com.bavlo.weixin.qiye.util;

import java.util.ArrayList;
import java.util.List;

import com.bavlo.weixin.qiye.pojo.AccessToken;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 微信企业号调用类 {"errcode":0,"errmsg":"ok"} 此结果表示调用方法成功返回
 * 
 * @author shijf
 * 
 */
public class QiYeUtil {
	/**
	 * 获取企业号AccessToken
	 * 
	 * @param CorpID
	 * @param CorpSecret
	 * @return
	 */
	public static AccessToken getAccessToken(String CorpID, String CorpSecret) {
		AccessToken accessToken = WechatAccessToken.getAccessToken(CorpID,
				CorpSecret, 1);
		return accessToken;
	}

	/**
	 * OAuth2验证接口根据code获取成员信息
	 * 
	 * @param token
	 * @param code
	 * @param AgentID
	 * @return
	 */
	public static Result<String> oAuth2GetUserByCode(String token, String code,
			int AgentID) {
		Result<String> result = new Result<String>();
		JSONObject jo = WechatOAuth2.getUserByCode(token, code, AgentID);
		if (jo != null) {
			try {
				String userId = jo.getString("UserId");
				if (userId != null && userId.length() > 0) {
					result.setErrmsg("");
					result.setErrcode("0");
					result.setObj(userId);
				} else {
					result.setErrmsg(jo.getString("errmsg"));
					result.setErrcode(jo.getString("errcode"));
				}

			} catch (Exception e) {
				result.setErrmsg("accessToken 超时......");
				result.setErrcode("42001");
			}
		}
		return result;
	}
	
	/**
	 * 获取所有标签ID
	 * @return
	 */
	public static List<Integer> getTagIdList() {
		//接收到微信返回结果
		JSONObject jo = WechatTag.getTagList();
		//把标签列表转为JSONArray
		JSONArray tagList = (JSONArray) jo.get("taglist");
		//遍历标签并放入list
		List<Integer> tagids = new ArrayList<Integer>();
		for(int i=0; i< tagList.size(); i++){
			try {
				tagids.add(Integer.valueOf(tagList.getJSONObject(i).getString("tagid")).intValue());
			} catch (NumberFormatException e) {
			    e.printStackTrace();
			}
		}
		return tagids;
	}
	
	/**
	 * 获取所有标签名称
	 * @return
	 */
	public static List<String> getTagNameList() {
		//接收到微信返回结果
		JSONObject jo = WechatTag.getTagList();
		//把标签列表转为JSONArray
		JSONArray tagList = (JSONArray) jo.get("taglist");
		//遍历标签并放入list
		List<String> tagNames = new ArrayList<String>();
		for(int i=0; i< tagList.size(); i++){
			try {
				tagNames.add(tagList.getJSONObject(i).getString("tagname"));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		return tagNames;
	}
	
	public static List<String> getUserTag(String UserId) {
		
		List<String> userTag = new ArrayList<String>();
		
		//获取所有标签ID
		List<Integer> tagIds = QiYeUtil.getTagIdList();
		//获取所有标签名称
		List<String> tagNames = QiYeUtil.getTagNameList();
		//遍历list里面的标签
		for(int i = 0; i < tagIds.size(); i++){
			int tagid = tagIds.get(i);
			String tagname = tagNames.get(i);
			JSONObject jo = WechatTag.getUserList(tagid);//查找所有标签里的所有用户
			JSONArray ja = (JSONArray) jo.get("userlist");
			for(int j=0; j< ja.size(); j++){
				try {
					String userId = ja.getJSONObject(j).getString("userid");
					if(UserId != null&&UserId.equals(userId)){
						userTag.add(tagname);
					}
					System.out.println("userTag="+userTag);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		}
		return userTag;
	}
	
}
