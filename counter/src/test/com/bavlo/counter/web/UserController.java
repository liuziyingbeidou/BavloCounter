package com.bavlo.counter.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bavlo.counter.model.User;
import com.bavlo.counter.service.custom.impl.UserService;

@Controller("userController")
@RequestMapping(value = "/user")
// ��ʾҪ�������action��ʱ��Ҫ�������//user·��
public class UserController extends BaseController {

	@Resource
	private UserService userService;

	/*
	 * ���ղ���getParameter()��ʱ��:
	 * �����ַ��/springmvc/hello.htm����û�д��ݲ���,��ô��idΪint�͵�ʱ��ᱨ��,��idΪInteger��ʱ��ֵΪnull
	 * ����ַ��Ϊ/springmvc/hello.htm?id=10��ʱ��,action�������ֽ��շ�ʽ 1��String
	 * hello(@RequestParam(value = "userid") int
	 * id),������ѵ�ַ��������Ϊuserid��ֵ��������id,����õ�ַ���ϵĲ�����Ϊid,����ղ��� 2��String
	 * hello(@RequestParam int id),���������Ĭ�ϻ��id��Ϊ�����������н��ո�ֵ 3��String hello(int
	 * id),���������Ҳ��Ĭ�ϰ�id��Ϊ�����������н��ո�ֵ
	 * ע:�������ǰ�����@RequestParamע��,�����ַ������û�м��ϸ�ע��Ĳ���,����:id,��ô�ᱨ404����,�Ҳ�����·��
	 * 3.�����õط���˵
	 *	forward:һ�������û���½��ʱ��,���ݽ�ɫת������Ӧ��ģ��.
	 *	redirect:һ�������û�ע����½ʱ������ҳ�����ת����������վ��.
	 */
	@RequestMapping(value = "/hello.htm")
	public String hello(int id) {// getParameter()�ķ�ʽ
		System.out.println("hello action:" + id);
		// return "hello";
		return "redirect:/index.jsp";// �����ض���web-info������ļ�,������Ҫд�Ͼ���·��
	}

	// ����ҳ������ĵ�һ�ַ�ʽ,���β��з���һ��map
	@RequestMapping(value = "/hello1.htm")
	public String hello(int id, Map<String, Object> map) {
		System.out.println("hello1 action:" + id);
		map.put("name", "huangjie");
		return "test";
	}

	// ����ҳ������ĵڶ��ַ�ʽ,���β��з���һ��Model
	@RequestMapping(value = "/hello2.htm")
	public String hello2(int id, Model model) {
		System.out.println("hello2 action:" + id);
		model.addAttribute("name", "huangjie");
		// ���ֻ��ֵû�м��������,ʹ��Object��������Ϊkey,String-->string
		model.addAttribute("ok");
		return "test";
	}

	// �õ�request,response,session��,ֻҪ�ڷ����β���������������
	@RequestMapping(value = "/hello3.htm")
	public String hello3(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("hello3 action:" + id);
		return "test";
	}

	@RequestMapping(value = "/test")
	public String test(Model model){
		model.addAttribute("name", "С��");
		model.addAttribute("string", "˵��һ�仰...");
		return "test";
	}
	
	@RequestMapping(params = "method=log")
	public ModelAndView log(User user) {
		System.out.println("�û���¼");
		userService.test();
		
		//return "log_fail";
		
		return new ModelAndView("redirect:page/test.jsp");//forward:
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login2(HttpServletRequest request) {
		String username = request.getParameter("username").trim();
		System.out.println(username);
		return "login2";
	}
}
