package com.bavlo.counter.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bavlo.counter.httpclient.HttpTools;

/**
 * @Title: 宝珑Counter
 * @ClassName: HttpContrller 
 * @Description: ajax对远程接口的访问(json)
 * @author liuzy
 * @date 2015-10-21 下午04:50:48
 */
@Controller
@RequestMapping(value="/webservice")
public class HttpContrller extends BaseController {

	@RequestMapping(value="/http",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String request(String url){
		System.out.println("开始调用远程接口...");
		return HttpTools.getDataByURL(url);
	}
}
