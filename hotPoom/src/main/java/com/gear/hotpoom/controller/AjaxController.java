package com.gear.hotpoom.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gear.hotpoom.service.ChatUsersService;
import com.gear.hotpoom.service.MessagesService;
import com.gear.hotpoom.vo.Message;

@RestController
@RequestMapping("/ajax")
public class AjaxController {

	@Autowired
	private ChatUsersService chatUsersService;
	
	@Autowired
	private MessagesService messagesService;
	
	
	// 삭제처리
	@RequestMapping(value="/invisible", method=RequestMethod.GET)
	public int invisibleChat(int roomNo, int userNo) {
		chatUsersService.invisibleChat(roomNo, userNo);
		return 1;
	}
	
	// 메시지불러오기
	@RequestMapping(value = "/message")
	public List<Message> getMessageList(int roomNo, int userNo) {
		Message message = new Message(roomNo, userNo);
		
		return messagesService.getMessageList(message);
	}
	
	
}
