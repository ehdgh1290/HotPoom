package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.User;

@Repository
public class ChatUsersDAOImpl implements ChatUsersDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertAdminChatUser(int roomNo) {
		// TODO Auto-generated method stub
		return session.insert("chat-users.insertFirstChatUser",roomNo);
	}
	
	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		return session.insert("chat-users.insert",user);
	}
}
