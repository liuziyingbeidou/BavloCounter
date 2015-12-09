package com.bavlo.weixin.fuwu.service.itf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Title: 宝珑Counter
 * @ClassName: ICoreService 
 * @Description: 微信服务号
 * @author liuzy
 * @date 2015-12-9 上午09:41:14
 */
public interface ICoreService {

	public String processRequest(HttpServletRequest request,HttpSession session);
}
