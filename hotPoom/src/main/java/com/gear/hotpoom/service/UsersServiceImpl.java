package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.UsersDAO;
import com.gear.hotpoom.vo.User;

@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersDAO usersDAO;
	
	@Override //로그인 정보가 맞는지 확인
	public User loginCheck(User user) {
		return usersDAO.selectLogin(user);
	}
	
}
