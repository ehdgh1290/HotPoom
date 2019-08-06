package com.gear.hotpoom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;

@Controller
public class UserController {
	@Autowired
	private UsersService service;
	
	@RequestMapping(value="/session",method=RequestMethod.POST)
	public String login(User user,HttpSession session, @RequestHeader String referer, RedirectAttributes ra) {
		User loginUser = service.loginCheck(user);
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}else {
			ra.addFlashAttribute("loginFail", true);
		}
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/session",method=RequestMethod.DELETE)
	public String logout(HttpSession session, @RequestHeader String referer) {
		session.removeAttribute("loginUser");
		return "redirect:"+referer;
	}

}
