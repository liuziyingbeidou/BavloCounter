package com.bavlo.counter.service.test.impl;

import org.springframework.stereotype.Service;

import com.bavlo.counter.service.impl.CommonService;
import com.bavlo.counter.service.test.itf.IUserService;

@Service("userService")
public class UserService extends CommonService implements IUserService{

	@Override
	public void test() {
		String sql = "select id from user where name='test'";
    	Integer it = findIntBySQL(sql, null);
    	System.out.println("≤‚ ‘id:"+it);
	}
    
  
}