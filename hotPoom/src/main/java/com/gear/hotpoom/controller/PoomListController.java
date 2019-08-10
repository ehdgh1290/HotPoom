package com.gear.hotpoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PoomListController {
	@RequestMapping(value="/poom/species/{speciesNo}/address/{mainAddress}/petCnt/{petCnt}", method=RequestMethod.GET)
	public String getPoomList(@PathVariable int speciesNo, @PathVariable String mainAddress, @PathVariable int petCnt, Model model) {
		return "hotelList";
	}
	
}
