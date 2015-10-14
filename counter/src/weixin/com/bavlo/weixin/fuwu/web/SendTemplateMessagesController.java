package com.bavlo.weixin.fuwu.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.weixin.fuwu.util.TemplateMessagesUtil;

/**
 * @author shiJf 发送消息控制类
 *
 */
@Controller
public class SendTemplateMessagesController {

	@RequestMapping("/sendTemplateMessages.do")
	public String sendMassage() {
		TemplateMessagesUtil.toSendTemplateMessages();
		return "user";
	}

}
