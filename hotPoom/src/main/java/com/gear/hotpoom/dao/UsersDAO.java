package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.User;

public interface UsersDAO {
	
	public int selectNoByEmail(String email);

	public User selectLogin(User user);

	public int selectCheckId(String email);
	
	public int updatePassword(User user);

}
