package com.bavlo.weixin.qiye.test;

import java.util.Map;

import net.sf.json.JSONObject;

import org.junit.Test;

import com.bavlo.weixin.qiye.aes.Sign;
import com.bavlo.weixin.qiye.pojo.AccessToken;
import com.bavlo.weixin.qiye.util.QiYeUtil;
import com.bavlo.weixin.qiye.util.WechatTicket;

public class TestSign {
	private static AccessToken accessToken = null;
	static {
		accessToken = QiYeUtil.getAccessToken(null,"wx24f6f768b6dd72fe", "albkD_XkbILSc25BGYw6PaYpyWL7ileFjxI0WYKZ5dQfZpYnuLXR-ejFm_uvrLLh");
		//accessToken=new AccessToken();
		//accessToken.setToken("qVsCpDcwUlrxKeryuOVN1UTlRtfH--nAXNH9PnB62gReOMZ9fdHG7lNOT1HRKb-zW7Ywk_7OffZwdKDETlb8LQ");
	}

	@Test
	public void testSign() {
		String url = "http://qiye.omsapp.cn/jsapi";
		JSONObject jo = WechatTicket.getTicket(accessToken.getToken());
		System.out.println(jo);
		Map<String, String> ret = Sign.sign(jo.getString("ticket"), url);
        for (Map.Entry entry : ret.entrySet()) {
            System.out.println(entry.getKey() + ", " + entry.getValue());
        }
		
	}
}
