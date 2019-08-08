package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;

@Repository
public class ChatRoomsDAOImpl implements ChatRoomsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ChatUser> selectChatRoom(int no) {
		return session.selectList("chat-users.selectChatList",no);
	}
	
	@Override
	public int makeRoom(CheckRoom checkRoom) {
		return session.insert("chat-rooms.makeRoom", checkRoom);
	}
}
