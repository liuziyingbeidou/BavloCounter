package com.bavlo.counter.utils;

/**
 * @Title: 宝珑Counter
 * @ClassName: CommonUtils 
 * @Description: 工具
 * @author liuzy
 * @date 2015-11-2 下午07:14:41
 */
public class CommonUtils {

	//获取小图名称
	public static String getMinPicName(String uploadFileName){
		String minFileName = null;
		int index = uploadFileName.lastIndexOf(".");
        if (index != -1) {
        	minFileName = uploadFileName.substring(0, index) + "_min" + uploadFileName.substring(index);
        }
        return minFileName;
	}
}
