package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.ChatRoom;

@Repository
public class ChatRoomsDAOImpl implements ChatRoomsDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public int addChatRoom(ChatRoom chatRoom) {
		// TODO Auto-generated method stub
		return session.insert("chat-rooms.insert",chatRoom);
	}
}
