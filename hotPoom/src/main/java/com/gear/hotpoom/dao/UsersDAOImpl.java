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
	
}
