package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.User;

@Repository
public class UsersDAOImpl implements UsersDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override

	public User selectLogin(User user) {
		return session.selectOne("users.selectLogin", user);
	}

	public int selectNoByEmail(String email) {
		return session.selectOne("users.selectNoByEmail", email);
	}
	
	@Override
	public int selectCheckId(String email) {
		return session.selectOne("users.selectCheckId",email);
	}
	
	@Override
	public int updatePassword(User user) {
		return session.update("users.updatePassword",user);
	}

}
