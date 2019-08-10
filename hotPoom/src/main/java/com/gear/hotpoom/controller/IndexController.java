package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.PoomsService;

@Controller
public class IndexController {
	
	@Autowired
	private PoomsService poomsService;
	
	
	//index
	@RequestMapping(value={"/", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("newPoomList",poomsService.getListNP());
		return "index";
	}//index() end

	//buisness 페이지 홈
	@RequestMapping(value="/buisness",method=RequestMethod.GET)
	public String buisness() {
		return "buisness";
	}
	
}
