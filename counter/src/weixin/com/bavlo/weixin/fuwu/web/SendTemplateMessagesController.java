package com.bavlo.weixin.fuwu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.weixin.fuwu.templateMessages.TemplateMessages;
import com.bavlo.weixin.fuwu.util.TemplateMessagesUtil;

/**
 * @author shiJf 发送消息控制类
 *
 */
@Controller
public class SendTemplateMessagesController {
	
	@RequestMapping("/sendTM.do")
	public String sendMassage(String toUser,String url) {
		TemplateMessages templateMessages = new TemplateMessages();
		
		templateMessages.setTouser(toUser);
		templateMessages.setTemplate_id("BwCWkLwucHr2Fso9sEwhpQXRqPEO9hXA_dCCQHOHrXA");
		templateMessages.setUrl(url);
		
		String str = TemplateMessagesUtil.toSendTemplateMessages(templateMessages);
		return str;
	}

}
