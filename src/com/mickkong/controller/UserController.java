package com.mickkong.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mickkong.pojo.User;
import com.mickkong.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(String username, String password, HttpSession session) {
		int result = userService.login(username, password);
		if (result == UserServiceImpl.SUCCESS) {
			session.setAttribute("user", userService.findByUsername(username));
			session.setMaxInactiveInterval(60 * 60);
			return "success";
		} else if (result == UserServiceImpl.PWDERROR) {
			return "密码错误！";
		} else if (result == UserServiceImpl.NONEXIST) {
			return "用户不存在！";
		}
		return "";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String register(String username, String password, String phone, String email) {
		User user = new User(username, password, phone, email);
		int result = userService.register(user);
		if (result == UserServiceImpl.SUCCESS) {
			return "success";
		}
		return "用户名已被注册！";
	}

	@RequestMapping(value = "/findpwd", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findpwd(String username, String password, String phone, String email) {
		User user = new User(username, password, phone, email);
		int result = userService.findPwd(user);
		if (result == UserServiceImpl.SUCCESS) {
			return "success";
		} else if (result == UserServiceImpl.UNMISMATCH) {
			return "信息不匹配！";
		}
		return "用户不存在！";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public ModelAndView edit(HttpSession session, String uid) {
		ModelAndView view = new ModelAndView("personInfo");
		User user = (User) session.getAttribute("user");
		view.addObject("user", user);
		return view;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public ModelAndView update(HttpSession session,String phone, String email) {
		ModelAndView view = new ModelAndView("personInfo");
		User user = (User) session.getAttribute("user");
		user.setPhone(phone);
		user.setEmail(email);
		session.setAttribute("user", user);
		userService.update(user);
		return view;
	}

}
