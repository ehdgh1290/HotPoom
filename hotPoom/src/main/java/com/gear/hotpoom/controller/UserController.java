package com.gear.hotpoom.controller;


import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PathVariable;
import com.gear.hotpoom.service.CertsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;

@Controller
public class UserController {

	@Autowired
	private UsersService service;
	@Autowired
	private CertsService certsService;
	
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
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/user/password/find",method=RequestMethod.GET)
	public String passwordFindForm() {
		return "passwordFindForm";
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/ajax/send/email",method=RequestMethod.POST)
	@ResponseBody
	public int emailSend(String email) {
		return usersService.getUserNo(email);
	}
	
	//비밀번호 재설정 페이지로 이동
	@RequestMapping(value="/user/{no}/password/update",method=RequestMethod.GET)
	public String passwordResetForm(@PathVariable int no) {		
		return "passwordUpdateForm";
	}
	
	//비밀번호 재설정
	@RequestMapping(value="/user/password/update", method=RequestMethod.POST)
	public String passwordReset(User user, int no) {
		usersService.updatePassword(user,no);
		return "index";
	}

}
