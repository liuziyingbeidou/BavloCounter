package com.bavlo.weixin.qiye.test;

import java.io.File;

import net.sf.json.JSONObject;

import org.junit.Test;

import com.bavlo.weixin.qiye.pojo.AccessToken;
import com.bavlo.weixin.qiye.util.QiYeUtil;
import com.bavlo.weixin.qiye.util.WechatUpload;

public class TestFile {
	private static AccessToken accessToken = null;
	static {
		accessToken = QiYeUtil.getAccessToken("wx92143a3fe231706b", "zEvl_oOeAzqVHMy0Fh8Pxx1R2huAHoKG3gfD5JEikfY");
	}

	@Test
	public void testUploadByUrl() {
		String fileUrl = "http://testfile.assn.cn/excel/123微信汇盟平台操作疑问.docx";
		JSONObject jo = WechatUpload.upload(accessToken.getToken(), "file", fileUrl);
	}

	@Test
	public void testUrl() {
		String fileUrl = "http://testfile.assn.cn/excel/14133660632033000.xls";
		String str = WechatUpload.getFileName(fileUrl,null);
		System.out.println(str);
	}
	
	@Test
	public void testFileName() {
		String fileUrl = "http://testfile.assn.cn/excel/14133660632033000.xls";
		File file=new File(fileUrl);
		String str = WechatUpload.getFileName(file);
		System.out.println(str);
	}

	@Test
	public void testUpload() {
		String fileUrl = "D:\\ASSN发布\\123微信汇盟平台操作疑问.docx";
		File file=new File(fileUrl);
		JSONObject jo = WechatUpload.uploadByFile(accessToken.getToken(), "file", file);
	}
	
	
	@Test
	public void testUpload1() {
		String fileUrl = "D:\\ASSN发布\\123微信汇盟平台操作疑问.docx";
		File file=new File(fileUrl);
		WechatUpload.upload(accessToken.getToken(), "file", file);
	}
	
	@Test
	public void testUpload2() {
		String fileUrl = "D:\\ASSN发布\\123微信汇盟平台操作疑问.docx";
		File file=new File(fileUrl);
		WechatUpload.uploadxxx(accessToken.getToken(), "file", file);
	}
	
}
