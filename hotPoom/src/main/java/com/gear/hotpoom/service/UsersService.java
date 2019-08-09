package com.gear.hotpoom.service;

import java.util.Map;

import com.gear.hotpoom.vo.User;

public interface UsersService {
	
	public int getUserNo(String email);

	public User loginCheck(User user);

	public int updatePassword(User user,int no);

	
	
	
	
	
	
	
	public Map<String,Object> getAccountDetail(int userNo);
	
	public int modifyName(User user);

	public int modifyPhoneNum(User user);
	
	
	
	
	
	public boolean checkEmail(String email);

	public int sign(User user);
}
