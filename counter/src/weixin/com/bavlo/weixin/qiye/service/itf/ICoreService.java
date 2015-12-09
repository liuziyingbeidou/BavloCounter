package com.bavlo.weixin.qiye.service.itf;

import javax.servlet.http.HttpSession;

/**
 * @Title: 宝珑Counter
 * @ClassName: ICoreService 
 * @Description: 微信企业号 
 * @author liuzy
 * @date 2015-12-9 下午02:48:48
 */
public interface ICoreService {

	public String processRequest(String msg,HttpSession session);
}
