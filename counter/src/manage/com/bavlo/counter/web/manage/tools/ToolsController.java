package com.bavlo.counter.web.manage.tools;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.model.manage.tools.QrcodeVO;
import com.bavlo.counter.service.manage.tools.itf.IToolsService;
import com.bavlo.counter.utils.CommonUtils;
import com.bavlo.counter.web.BaseController;
import com.bavlo.weixin.fuwu.util.AdvancedUtil;
import com.bavlo.weixin.fuwu.util.CommonUtil;
import com.bavlo.weixin.fuwu.util.IContant;

/**
 * @Title: ����Counter
 * @ClassName: ToolsController 
 * @Description: ���߹���Controller
 * @author liuzy
 * @date 2015-12-7 ����04:12:33
 */
@Controller("toolsController")
@RequestMapping(value="/tools")
public class ToolsController extends BaseController implements ServletContextAware{
	
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
	 * @Description: �����ͷ���ά��
	 * @param @return
	 * @return ModelAndView
	 */
	@RequestMapping(value="/createQrcode")
	public void createQrcode(QrcodeVO qrcodeVO,HttpServletRequest request,HttpSession session){
		/**���ɶ�ά��**/
		// ��ȡ�ӿڷ���ƾ֤
		String accessToken = session.getAttribute("fw-accessToken")+"";
		if(CommonUtils.isNull(accessToken)){
			accessToken = CommonUtil.getToken(IContant.appId, IContant.appSecret).getAccessToken();
		}
		String vname = qrcodeVO.getVshop()+"@"+qrcodeVO.getVkfcode();
		String ticketStr = AdvancedUtil.createPermanentQRCode(accessToken, vname);
		String basePath = servletContext.getRealPath("/"); 
		String qrPath = basePath+"/resources/qrcode";
		qrcodeVO.setVqrcodeUrl(AdvancedUtil.getQRCode(ticketStr,qrPath,vname));
		
		QrcodeVO vo = toolsService.saveQrcode(qrcodeVO);
		renderJson(vo);
	}
	
	@RequestMapping(value="/getListQrcode")
	public void getListQrcode(String condition){
		Map<String, Object> jsonmap = toolsService.getListQrcode(condition,dgpage,rows);
		renderJson(jsonmap);
	}
	
    @Override  
    public void setServletContext(ServletContext servletContext) {  
        this.servletContext = servletContext;  
    }  
}
