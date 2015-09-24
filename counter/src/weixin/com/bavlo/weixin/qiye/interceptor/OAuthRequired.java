package com.bavlo.weixin.qiye.interceptor;

import java.lang.annotation.*;
/**
 * 验证OAuth2注解
 * @author shijf
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface OAuthRequired {
	
}
