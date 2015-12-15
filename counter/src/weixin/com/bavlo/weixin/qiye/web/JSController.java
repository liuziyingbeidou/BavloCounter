package com.bavlo.weixin.qiye.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.qiye.aes.Sign;
import com.bavlo.weixin.qiye.pojo.AccessToken;
import com.bavlo.weixin.qiye.util.Constants;
import com.bavlo.weixin.qiye.util.QiYeUtil;
import com.bavlo.weixin.qiye.util.WechatTicket;

@Controller
public class JSController extends BaseController{
	private static AccessToken accessToken = null;
	static{
		accessToken = QiYeUtil.getAccessToken(null,Constants.CORPID, Constants.SECRET );
	}
	
	@RequestMapping(value="/jsapi")
	public String helloJs(Model model){
		
		String url = "http://qiye.omsapp.cn/jsapi";
		JSONObject jo = WechatTicket.getTicket(accessToken.getToken());
		Map<String, String> ret = Sign.sign(jo.getString("ticket"), url);
        model.addAttribute("appid", Constants.CORPID);
        model.addAttribute("jsapi_ticket", ret.get("jsapi_ticket"));
        model.addAttribute("timestamp", ret.get("timestamp"));
        model.addAttribute("nonceStr", ret.get("nonceStr"));
        model.addAttribute("signature", ret.get("signature"));
		return "jsapi";
	}
}
