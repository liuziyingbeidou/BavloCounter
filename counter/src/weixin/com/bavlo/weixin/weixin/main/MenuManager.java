package com.bavlo.weixin.weixin.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bavlo.weixin.fuwu.menu.Button;
import com.bavlo.weixin.fuwu.menu.ComplexButton;
import com.bavlo.weixin.fuwu.menu.Menu;
import com.bavlo.weixin.fuwu.menu.ViewButton;
import com.bavlo.weixin.fuwu.pojo.Token;
import com.bavlo.weixin.fuwu.util.CommonUtil;
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
	private static Menu getMenu() {
		
		ViewButton btn11 = new ViewButton();
		btn11.setName("Home");
		btn11.setType("view");
		btn11.setUrl("http://m.bavlo.com");
		
		ViewButton btn12 = new ViewButton();
		btn12.setName("戒指");
		btn12.setType("view");
		btn12.setUrl("http://m.bavlo.com/mobile/style_list.html?st=1");
		
		ViewButton btn13 = new ViewButton();
		btn13.setName("项饰");
		btn13.setType("view");
		btn13.setUrl("http://m.bavlo.com/mobile/style_list.html?st=2");
		
		ViewButton btn14 = new ViewButton();
		btn14.setName("耳饰");
		btn14.setType("view");
		btn14.setUrl("http://m.bavlo.com/mobile/style_list.html?st=3");
		
		ViewButton btn15 = new ViewButton();
		btn15.setName("金塔宝石");
		btn15.setType("view");
		btn15.setUrl("http://www.gemtak.com");

		ViewButton btn21 = new ViewButton();
		btn21.setName("宝珑品牌");
		btn21.setType("view");
		btn21.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=10000001&idx=1&sn=634c45dcdefd6eebdcb60cead82755b1#rd");

		ViewButton btn22 = new ViewButton();
		btn22.setName("招商加盟");
		btn22.setType("view");
		btn22.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=503438200&idx=1&sn=405267860efb379b72c0ed5dab621992&scene=1&srcid=0723UJOGJZntOM2xi9gI7aBl&from=singlemessage&isappinstalled=0#wechat_redirect");

		ViewButton btn23 = new ViewButton();
		btn23.setName("联系我们");
		btn23.setType("view");
		btn23.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=208833779&idx=1&sn=95af8523661d13f478a359ff5c0e83c2#rd");

		ViewButton btn31 = new ViewButton();
		btn31.setName("会员制度");
		btn31.setType("view");
		btn31.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5OTMyODM4MQ==&mid=209465560&idx=1&sn=9cdc79df2020e9d6fafe2a5eead00d94#rd");

		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("精品款式");
		mainBtn1.setSub_button(new Button[] { btn11, btn12, btn13, btn14, btn15 });

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("About");
		mainBtn2.setSub_button(new Button[] { btn21, btn22, btn23 });

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("会员制度");
		mainBtn3.setSub_button(new Button[] { btn31 });

		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

		return menu;
	}

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = "wx131f914729afa196";
		// 第三方用户唯一凭证密钥
		String appSecret = "3c40c5e22c78bc57d3b2d9d0938e3ce2";

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