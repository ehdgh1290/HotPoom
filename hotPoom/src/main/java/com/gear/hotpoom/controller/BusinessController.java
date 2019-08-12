package com.gear.hotpoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BusinessController {
	
	
	@RequestMapping(value="/business",method=RequestMethod.GET)
	public String hosting() {
		
		return "hosting";
	}
	
	@RequestMapping(value="/calender",method=RequestMethod.GET)
	public String calenderDetail() {
		
		return "calenderDetail";
	}
	
	@RequestMapping(value="/chart",method=RequestMethod.GET)
	public String chart() {
		
		return "chart";
	}
	
	@RequestMapping(value="/hosting/poom",method=RequestMethod.GET)
	public String poom() {
		
		return "myHotelList";
	}
	
	@RequestMapping(value="/reservation",method=RequestMethod.GET)
	public String reservation() {
		
		return "reservations";
	}
	
	
	@RequestMapping(value="/buisness/receipt",method=RequestMethod.GET)
	public String receipt() {
		return "receipt";
	}
	
	@RequestMapping(value="/business/message", method=RequestMethod.GET)
	public String buisnessMessage(Model model) {
		model.addAttribute("business", true);
		return "message";
	}
	
}
