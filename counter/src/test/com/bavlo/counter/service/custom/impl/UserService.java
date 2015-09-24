package com.bavlo.counter.service.custom.impl;

import org.springframework.stereotype.Service;

import com.bavlo.counter.service.custom.itf.IUserService;
import com.bavlo.counter.service.impl.CommonService;

@Service("userService")
public class UserService extends CommonService implements IUserService{

	@Override
	public void test() {
		String sql = "select id from user where name='test'";
    	Integer it = findIntBySQL(sql, null);
    	System.out.println("≤‚ ‘id:"+it);
	}
    
  
}