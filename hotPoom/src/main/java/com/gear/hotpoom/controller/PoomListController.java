package com.gear.hotpoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PoomListController {

	@RequestMapping(value="/poom", method=RequestMethod.GET)
	public String getPoomList() {
		return "hotelList";
	}
	
}
