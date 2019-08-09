package com.gear.hotpoom.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.BookingsService;
import com.gear.hotpoom.vo.Booking;

@Controller
public class BookingController {
	@Autowired
	private BookingsService service;
	
	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public String booking() {
		
		return "booking";
	}
	
	@RequestMapping(value="/booking",method=RequestMethod.POST)
	public String register(Booking booking, HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		
		Integer seq = (Integer)application.getAttribute("bookingSeq");
		if(seq==null) {
			//System.out.println("seq가 null이야");
			seq = 0;
			application.setAttribute("bookingSeq", seq);
		}//if end
		
		seq = (Integer)application.getAttribute("bookingSeq")+1;
		application.setAttribute("bookingSeq", seq);
		
		System.out.println("bookingSeq:"+seq);
		
		booking.setNo(String.valueOf(seq));
		
		service.register(booking);
		
		return "redirect:/booking";
	}//register() end
	
}
