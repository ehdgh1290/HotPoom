package com.gear.hotpoom.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gear.hotpoom.service.CertsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private CertsService certsService;
	@Autowired
	private UsersService usersService;
	
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
