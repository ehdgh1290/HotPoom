package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.ReviewsService;
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewsService service;
	
	@RequestMapping(value="/review",method=RequestMethod.POST)
	public String reviewRegister(Review review) {
		System.out.println("컨트롤러....");
		service.register(review);
		return "redirect:/booking";
	}
	
}