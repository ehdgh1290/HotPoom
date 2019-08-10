package com.gear.hotpoom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.vo.User;

@Controller
public class BookmarkController {
	@Autowired
	private PoomsService poomsService;
	
	
	@RequestMapping(value="/bookmark", method=RequestMethod.GET)
	public String bookmarkList(Model model, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		model.addAllAttributes(poomsService.getCompareCardDetail(loginUser.getNo()));
		
		return "bookmarkList";
	}

}