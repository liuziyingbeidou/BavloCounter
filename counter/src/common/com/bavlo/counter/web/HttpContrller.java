package com.bavlo.counter.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bavlo.counter.httpclient.HttpTools;

/**
 * @Title: ����Counter
 * @ClassName: HttpContrller 
 * @Description: ajax��Զ�̽ӿڵķ���(json)
 * @author liuzy
 * @date 2015-10-21 ����04:50:48
 */
@Controller
@RequestMapping(value="/webservice")
public class HttpContrller extends BaseController {

	@RequestMapping(value="/http",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String request(String url){
		System.out.println("��ʼ����Զ�̽ӿ�...");
		return HttpTools.getDataByURL(url);
	}
}
