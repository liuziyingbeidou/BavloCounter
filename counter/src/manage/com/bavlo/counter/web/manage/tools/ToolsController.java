package com.bavlo.counter.web.manage.tools;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.model.manage.tools.QrcodeVO;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.fuwu.pojo.Token;
import com.bavlo.weixin.fuwu.util.AdvancedUtil;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;
import com.bavlo.weixin.fuwu.util.MenuUtil;
import com.bavlo.weixin.fuwu.web.MenuManager;

/**
 * @Title: 宝珑Counter
 * @ClassName: ToolsController 
 * @Description: 工具管理Controller
 * @author liuzy
 * @date 2015-12-7 下午04:12:33
 */
@Controller("toolsController")
@RequestMapping(value="/tools")
public class ToolsController extends BaseController implements ServletContextAware{
	private static Logger log = LoggerFactory.getLogger(ToolsController.class);
	
	@Resource
	IToolsService toolsService;
	
    private ServletContext servletContext; 
    
    @RequestMapping(value="/goEditeQrcode")
    public ModelAndView goEditeQrcode(Integer id){
    	
    	ModelAndView model = new ModelAndView("forward:/page/counter/tools/qrcode/qrcode-create.jsp");
    	model.addObject("qrcodevo", toolsService.getQrcodeVOById(id));
    	return model;
    }
    
    
	/**
	 * @Description: 创建客服二维码
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/createQrcode")
	public void createQrcode(QrcodeVO qrcodeVO,HttpServletRequest request,HttpSession session){
		/**生成二维码**/
		// 获取接口访问凭证
		String accessToken = session.getAttribute("fw-accessToken")+"";
		if(CommonUtils.isNull(accessToken)){
			accessToken = CommonUtil.getToken(IContant.appId, IContant.appSecret).getAccessToken();
		}
		String sceneStr = qrcodeVO.getVshop()+qrcodeVO.getVkfcode();
		String vfname = qrcodeVO.getVshop()+"@"+qrcodeVO.getVkfcode();
		String ticketStr = AdvancedUtil.createPermanentQRCode(accessToken, sceneStr);
		//String ticketStr = AdvancedUtil.createPermanentQRCode(accessToken, Integer.valueOf(qrcodeVO.getVkfcode()));
		String basePath = servletContext.getRealPath("/"); 
		String qrPath = basePath+"/resources/qrcode";
		qrcodeVO.setVqrcodeUrl(AdvancedUtil.getQRCode(ticketStr,qrPath,vfname));
		
		QrcodeVO vo = toolsService.saveQrcode(qrcodeVO);
		renderJson(vo);
	}
	
	@RequestMapping(value="/getListQrcode")
	public void getListQrcode(String condition){
		Map<String, Object> jsonmap = toolsService.getListQrcode(condition,dgpage,rows);
		renderJson(jsonmap);
	}
	
	@ResponseBody
	@RequestMapping(value="/createMenu")
	public String createMenu(){
		String bkInfo = "Menu Create Fail!";
		// 第三方用户唯一凭证
		String appId = IContant.appId;
		// 第三方用户唯一凭证密钥
		String appSecret = IContant.appSecret;

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);

		if (null != token) {
			// 创建菜单
			boolean result = MenuUtil.createMenu(com.bavlo.weixin.fuwu.web.MenuManager.getMenu(), token.getAccessToken());

			// 判断菜单创建结果
			if (result){
				bkInfo = "Menu Create Success!";
				log.info("菜单创建成功！");
			}
			else
				log.info("菜单创建失败！");
			
		}
		return bkInfo;
	}
	
    @Override  
    public void setServletContext(ServletContext servletContext) {  
        this.servletContext = servletContext;  
    }
    
}
