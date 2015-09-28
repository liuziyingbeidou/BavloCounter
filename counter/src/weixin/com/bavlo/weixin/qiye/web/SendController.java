package com.bavlo.weixin.qiye.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.weixin.qiye.util.WechatSendMessage;

/**
 * @author shiJf 发送消息控制类
 *
 */
@Controller
public class SendController {

	@RequestMapping("/sendMassage.do")
	public String sendMassage(String touser, String toparty, String totag,
			String agentid, String text) {
		WechatSendMessage.sendMassage(touser, "@all", "@all", "0", text);
		return "user";
	}

}
