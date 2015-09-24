package com.bavlo.weixin.qiye.test;


import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;

import com.bavlo.weixin.qiye.util.QiYeUtil;
import com.bavlo.weixin.qiye.util.WechatTag;

public class TestTag {
	
	/**
	 * 获取所有标签信息
	 */
	@Test
	public void getTagList() {
		//获取所有标签信息
		JSONObject jo = WechatTag.getTagList();
		System.out.println(jo);
	}
	
	/**
	 * 获取所有标签ID
	 */
	@Test
	public void getTagId() {
		//接收到微信返回结果
		JSONObject jo = WechatTag.getTagList();
		//把标签列表转为JSONArray
		JSONArray ja = (JSONArray) jo.get("taglist");
		//遍历标签
		for(int i=0; i< ja.size(); i++){
			try {
			    int num = Integer.valueOf(ja.getJSONObject(i).getString("tagid")).intValue();
			    System.out.println(num+".........");
			} catch (NumberFormatException e) {
			    e.printStackTrace();
			}
		}
		
	}
	
	@Test
	public void getUserId() {
		//获取所有标签ID，放入list
		List<Integer> tagids = QiYeUtil.getTagIdList();
		//遍历list里面的标签
		for(int i = 0; i < tagids.size(); i++){
			int tagid = tagids.get(i);
			JSONObject jo = WechatTag.getUserList(tagid);//查找所有标签里的所有用户
			JSONArray ja = (JSONArray) jo.get("userlist");
			for(int j=0; j< ja.size(); j++){
				try {
					String userId = ja.getJSONObject(j).getString("userid");
					System.out.println("userId======="+userId);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Test
	public void getUserTag() {
		QiYeUtil.getUserTag("shijianfeng");
	}
	
	
	
	@Test
	public void jo(){
		List<Integer> list = new ArrayList<Integer>();
		list.add(1);
		list.add(5654);
		list.add(45646);
		list.add(1321);
		System.out.println(list);
	}
}
