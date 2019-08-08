package com.gear.hotpoom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.vo.User;

@Controller
public class MessageController {

	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String asdf() {
		
		return "message";
	}
	/*
	@RequestMapping(value="/message/{no}", method=RequestMethod.GET)
	public String qweq(@PathVariable int no, HttpSession session) {
		
		User user = (User)(session.getAttribute("loginUser"));
				
		int userNo = user.getNo();

		int dd = selelct.(no, userNo);
		
		if(dd == 0) {
			만든다
		}
		
		
		return "message";
	}
	*/
}
