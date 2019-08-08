package com.gear.hotpoom.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.ChatRoomsService;
import com.gear.hotpoom.service.ChatUsersService;
import com.gear.hotpoom.vo.ChatRoom;
import com.gear.hotpoom.vo.CheckRoom;
import com.gear.hotpoom.vo.User;

@Controller
public class MessageController {

	@Autowired
	private ChatUsersService chatUsersService;
	
	@Autowired
	private ChatRoomsService chatRoomsService;
	
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String asdf() {
		
		return "message";
	}
	
	@RequestMapping(value="/message/{no}", method=RequestMethod.GET)
	public String qweq(@PathVariable int no, HttpSession session) {
		User user = (User)(session.getAttribute("loginUser"));
				
		//로그인 유저 번호
		int userNo = user.getNo();

		// 클릭한 유저 번호 no
		
		
		
		CheckRoom checkRoom = new CheckRoom(no, userNo);
		
		int cnt = chatUsersService.checkRoom(checkRoom);
		
		if(cnt == 0) {
			chatRoomsService.makeRoom(checkRoom);
		}
		
		
		return "redirect:/message";
	}
	
}
