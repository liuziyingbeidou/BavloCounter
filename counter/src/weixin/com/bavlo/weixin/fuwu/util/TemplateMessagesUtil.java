package com.bavlo.weixin.fuwu.util;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bavlo.weixin.fuwu.pojo.Token;
import com.bavlo.weixin.fuwu.templateMessages.Data;
import com.bavlo.weixin.fuwu.templateMessages.First;
import com.bavlo.weixin.fuwu.templateMessages.Keynote1;
import com.bavlo.weixin.fuwu.templateMessages.Keynote2;
import com.bavlo.weixin.fuwu.templateMessages.Keynote3;
import com.bavlo.weixin.fuwu.templateMessages.Remark;
import com.bavlo.weixin.fuwu.templateMessages.TemplateMessages;


public class TemplateMessagesUtil {
	private static Logger log = LoggerFactory.getLogger(TemplateMessagesUtil.class);

	// 发送模板消息（POST）
	public final static String templateMessages_send_url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";

	public static boolean sendTemplateMessages(TemplateMessages templateMessages, String accessToken) {
		boolean result = false;
		String url = templateMessages_send_url.replace("ACCESS_TOKEN", accessToken);
		// 将模板消息对象转换成json字符串
		String jsonTemplateMessages = JSONObject.fromObject(templateMessages).toString();
		// 发起POST请求创建菜单
		JSONObject jsonObject = CommonUtil.httpsRequest(url, "POST", jsonTemplateMessages);

		System.out.println(jsonTemplateMessages);
		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				System.out.println("发送模板消息成功");
			} else {
				result = false;
				System.out.println("发送模板消息失败");
				log.error("发送模板消息失败 errcode:{} errmsg:{}", errorCode, errorMsg);
				System.out.println(errorCode);
				System.out.println(errorMsg);
			}
		}

		return result;
	}
	
	/**
	 * 定义模板消息结构
	 * 
	 * @return
	 */
	private static TemplateMessages getTemplateMassgaes(TemplateMessages templateMessages) {
		
		First first = new First();
		first.setValue("恭喜你购买成功！");
		first.setColor("#173177");
		
		Keynote1 keynote1 = new Keynote1();
		keynote1.setValue("戒指");
		keynote1.setColor("#173177");
		
		Keynote2 keynote2 = new Keynote2();
		keynote2.setValue("1600元");
		keynote2.setColor("#173177");
		
		Keynote3 keynote3 = new Keynote3();
		keynote3.setValue("2014年9月22日");
		keynote3.setColor("#173177");
		
		Remark remark = new Remark();
		remark.setValue("欢迎再次购买！");
		remark.setColor("#173177");
		
		Data data = new Data();
		data.setFirst(first);
		data.setKeynote1(keynote1);
		data.setKeynote2(keynote2);
		data.setKeynote3(keynote3);
		data.setRemark(remark);
		
		templateMessages.setData(data);

		return templateMessages;
	}

	public static String toSendTemplateMessages(TemplateMessages templateMessages) {
		// 第三方用户唯一凭证
		String appId = IContant.appId;
		// 第三方用户唯一凭证密钥
		String appSecret = IContant.appSecret;

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);

		String str = "";
		if (null != token) {
			// 创建菜单
			boolean result = TemplateMessagesUtil.sendTemplateMessages(getTemplateMassgaes(templateMessages), token.getAccessToken());
			// 判断菜单创建结果
			if (result){
				str = "消息发送成功";
				log.info("模板消息发送成功！");
			} else {
				str = "消息发送失败";
				log.info("模板消息发送失败！");
			}
		}
		return str;
	}

}
