package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.ChatRoomsDAO;
import com.gear.hotpoom.dao.ChatUsersDAO;
import com.gear.hotpoom.vo.CheckRoom;

@Service
public class ChatRoomsServiceImpl implements ChatRoomsService{

	@Autowired
	private ChatRoomsDAO chatRoomsDAO;
	
	@Autowired
	private ChatUsersDAO chatUsersDAO;
	
	@Override
	public int makeRoom(CheckRoom checkRoom) {
		
		chatRoomsDAO.makeRoom(checkRoom);
		
		System.out.println(checkRoom.getRoomNo());
		
		
		
		chatUsersDAO.makeChatUser(checkRoom);
		System.out.println(checkRoom.getNo());
		
		checkRoom.setUserNo(checkRoom.getNo());
		
		chatUsersDAO.makeChatUser(checkRoom);
		
		return 1;
	}
	
}
