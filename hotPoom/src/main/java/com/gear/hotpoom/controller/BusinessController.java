package com.gear.hotpoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BusinessController {
	
	
	@RequestMapping(value="/hosting",method=RequestMethod.GET)
	public String hosting() {
		
		return "hosting";
	}
	
	

	
	
	
}
