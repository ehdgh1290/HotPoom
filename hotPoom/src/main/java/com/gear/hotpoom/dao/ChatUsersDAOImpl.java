package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.ChatUser;

@Repository
public class ChatUsersDAOImpl implements ChatUsersDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public int updateInvisible(ChatUser chatUser) {
		return session.update("chat-users.invisibleRoom", chatUser);
	}
}
