package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.BanksService;
import com.gear.hotpoom.service.PoomsService;

@Controller
public class PoomController {
	@Autowired
	private PoomsService service;
	
	//동호, poomDetail 기본 정보 가져오기(리뷰제외)
	@RequestMapping(value="/poom/{no}",method=RequestMethod.GET)
	public String poomDetail(@PathVariable int no, Model model) {
		
		model.addAllAttributes(service.getDetail(no));
		
		return "poomDetail";
	}
	
	
	@RequestMapping(value="/poom", method=RequestMethod.GET)
	public String getPoomList() {
		return "hotelList";
	}

}