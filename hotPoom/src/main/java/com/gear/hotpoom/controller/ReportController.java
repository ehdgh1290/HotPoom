package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.gear.hotpoom.service.PetsService;
import com.gear.hotpoom.service.ReportsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.Pet;

import com.gear.hotpoom.vo.Report;

@Controller
public class ReportController {
	@Autowired

	private ReportsService service;
	
	@RequestMapping(value="/report",method=RequestMethod.POST)
	public String register(Report report,@RequestHeader String referer) {
		service.register(report);
		return "redirect:"+referer;
	}
}





