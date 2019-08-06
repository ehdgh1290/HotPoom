package com.gear.hotpoom.controller;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gear.hotpoom.service.BookingsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	@Autowired
	private BookingsService bookingsService;

	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public Map<String,Object> getBookingList(int userNo, int pageNo) {
		return bookingsService.getList(userNo, pageNo);
	}
}
