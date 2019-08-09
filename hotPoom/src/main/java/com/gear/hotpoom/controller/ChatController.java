package com.gear.hotpoom.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.ChatRoomsService;
import com.gear.hotpoom.service.ChatUsersService;
import com.gear.hotpoom.service.MessagesService;
import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.Message;

@Controller
public class ChatController {
	

	@Autowired
	private ChatUsersService chatUsersService;
	
	@Autowired
	private MessagesService messagesService;
	
	@MessageMapping(value="/chat/list")
	@SendToUser("/queue/chat/list")
	public List<ChatUser> getChatRoomList(int no, SimpMessageHeaderAccessor accessor) {
		//@DestinationVariable = @PathVariable
		return chatUsersService.getChatRoomList(no);
	}	
	
	@MessageMapping(value="/chat/{nowRoomNo}")
	@SendTo("/topic/chat/{nowRoomNo}")
	public Message getMsg(Message message, SimpMessageHeaderAccessor accessor) {
		System.out.println(message.getContent());
		System.out.println(message.getUserNo());
		System.out.println(message.getRoomNo());
		
		messagesService.sendMessage(message);
		
		return message; 
	}
	
	
}
