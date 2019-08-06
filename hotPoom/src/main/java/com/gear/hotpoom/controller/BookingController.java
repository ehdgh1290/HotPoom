package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.BookingsService;

@Controller
public class BookingController {
	@Autowired
	private BookingsService service;
	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public String booking() {
		//updateBooking
		
		return "booking";
	}
	
	
	
}
