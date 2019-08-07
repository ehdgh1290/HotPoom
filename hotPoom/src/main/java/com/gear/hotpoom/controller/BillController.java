package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.BookingsService;
import com.gear.hotpoom.service.CancelsService;
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Cancel;

@Controller
public class BillController {
	
	@Autowired
	private BookingsService bookingsService;
	
	
	//예약 취소
	@RequestMapping(value="/cancel/booking", method=RequestMethod.PUT)
	public String canceledBooking(Cancel cancel) {
		
		 bookingsService.modifyBooking(cancel);
		// cancelsService.insertCancel(cancel);
		
		return "redirect:/booking";
	}//canceledBooking() end
	

	//bill page
	@RequestMapping(value="/bill/{bookingNo}", method=RequestMethod.GET)
	public String getBill(@PathVariable String bookingNo, Model model) {
		
		//System.out.println("GET /bill/{bookingNo} : "+bookingNo);
		
		Booking booking = bookingsService.getBill(bookingNo);
		
		//System.out.println("GET /bill/{bookingNo} : "+booking.getImg());
		
		model.addAttribute("bill", booking);
		
		return "bill";
	}//getBill() end
	
}
