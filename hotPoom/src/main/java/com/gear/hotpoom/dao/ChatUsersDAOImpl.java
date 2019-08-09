package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;
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

	// 채팅방 삭제해서 타입변경
	@Override
	public int updateInvisible(ChatUser chatUser) {
		return session.update("chat-users.invisibleRoom", chatUser);
	}
	
	//채팅방 있는지 확인
	@Override
	public int checkRoom(CheckRoom checkRoom) {
		return session.selectOne("chat-users.checkRoom", checkRoom);
	}
	
	//채팅 유저 insert
	@Override
	public int makeChatUser(CheckRoom checkRoom) {
		return session.insert("chat-users.insertUser", checkRoom);
	}
}
