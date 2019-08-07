package com.gear.hotpoom.service;

import com.gear.hotpoom.vo.User;

public interface UsersService {
	
	public int getUserNo(String email);

	public int updatePassword(User user,int no);
}
