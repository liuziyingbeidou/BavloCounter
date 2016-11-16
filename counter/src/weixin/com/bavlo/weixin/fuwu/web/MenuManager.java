package com.bavlo.weixin.fuwu.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bavlo.weixin.fuwu.menu.Button;
import com.bavlo.weixin.fuwu.menu.ComplexButton;
import com.bavlo.weixin.fuwu.menu.Menu;
import com.bavlo.weixin.fuwu.menu.ViewButton;
import com.bavlo.weixin.fuwu.pojo.Token;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;
import com.bavlo.weixin.fuwu.util.MenuUtil;


/**
 * 菜单管理器类
 * 
 * @author shijf
 */
public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);

	/**
	 * 定义菜单结构
	 * 
	 * @return
	 */
	public static Menu getMenu() {
		
		ViewButton btn11 = new ViewButton();
		btn11.setName("款式库");
		btn11.setType("view");
		btn11.setUrl("http://m.bavlo.com");
		
		ViewButton btn12 = new ViewButton();
		btn12.setName("宝石库");
		btn12.setType("view");
		btn12.setUrl("http://www.gemtak.com");
		
		ViewButton btn13 = new ViewButton();
		btn13.setName("创新科技");
		btn13.setType("view");
		btn13.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=2650922287&idx=1&sn=0c2339d3e99c2cbf9d0aafd05c6a2d97&chksm=bcc8523d8bbfdb2b282b6f383799cec36e7c5f94bc288a832cb42bfa3bf72be6fc096925601f&scene=0#wechat_redirect");
		
		/*ViewButton btn14 = new ViewButton();
		btn14.setName("耳饰");
		btn14.setType("view");
		btn14.setUrl("http://m.bavlo.com/mobile/style_list.html?st=3");
		
		ViewButton btn15 = new ViewButton();
		btn15.setName("钻石");
		btn15.setType("view");
		btn15.setUrl("http://m.bavlo.com/mobile/diamond_list.html");*/

		ViewButton btn21 = new ViewButton();
		btn21.setName("宝珑品牌");
		btn21.setType("view");
		btn21.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=10000001&idx=1&sn=634c45dcdefd6eebdcb60cead82755b1#rd");

		/*ViewButton btn22 = new ViewButton();
		btn22.setName("招商加盟");
		btn22.setType("view");
		btn22.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=503438200&idx=1&sn=405267860efb379b72c0ed5dab621992&scene=1&srcid=0723UJOGJZntOM2xi9gI7aBl&from=singlemessage&isappinstalled=0#wechat_redirect");*/
		
		ViewButton btn23 = new ViewButton();
		btn23.setName("Contact Us");
		btn23.setType("view");
		btn23.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=208833779&idx=1&sn=95af8523661d13f478a359ff5c0e83c2#rd");

		ViewButton btn24 = new ViewButton();
		btn24.setName("会员制度");
		btn24.setType("view");
		btn24.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=209465560&idx=1&sn=9cdc79df2020e9d6fafe2a5eead00d94#rd");

		/*ViewButton btn25 = new ViewButton();
		btn25.setName("ODM合作");
		btn25.setType("view");
		btn25.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=400506139&idx=1&sn=24f2b90fcb47f326095c03a20363e11e&scene=18#wechat_redirect");*/

		ViewButton btn31 = new ViewButton();
		btn31.setName("历史消息");
		btn31.setType("view");
		btn31.setUrl("http://mp.weixin.qq.com/mp/getmasssendmsg?__biz=MjM5OTMyODM4MQ==#wechat_webview_type=1&wechat_redirect");

		/*ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("精品款式");
		mainBtn1.setSub_button(new Button[] { btn11, btn12, btn13, btn14, btn15 });*/
		
		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("产品");
		mainBtn1.setSub_button(new Button[] { btn11, btn12, btn13});

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("About");
		mainBtn2.setSub_button(new Button[] { btn21, btn24,btn23 });  //btn25,

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("历史消息");
		mainBtn3.setSub_button(new Button[] { btn31 });

		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2, btn31 });

		return menu;
	}
	
	

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = IContant.appId;
		// 第三方用户唯一凭证密钥
		String appSecret = IContant.appSecret;

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);

		if (null != token) {
			// 创建菜单
			boolean result = MenuUtil.createMenu(getMenu(), token.getAccessToken());

			// 判断菜单创建结果
			if (result)
				log.info("菜单创建成功！");
			else
				log.info("菜单创建失败！");
		}
	}
}