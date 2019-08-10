package com.gear.hotpoom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.UsersService;

@Controller
public class BookmarkController {

	@Autowired
	private PoomsService poomsService;
	@Autowired
	private UsersService UsersService;
	
	
	@RequestMapping(value="/bookmark/{userNo}", method=RequestMethod.GET)
	public String bookmarkList(Model model, @PathVariable int userNo) {
	
		model.addAllAttributes(poomsService.getCompareCardDetail(userNo));
		
		return "bookmarkList";
	}
	

}
