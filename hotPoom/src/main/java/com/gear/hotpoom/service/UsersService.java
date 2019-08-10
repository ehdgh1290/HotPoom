package com.gear.hotpoom.service;

import java.util.Map;


import com.gear.hotpoom.vo.Photo;

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

	public Map<String, Object> getUserInfo(int userNo); // 유저페이지에서 정보 불러오기 .영훈

	public int updateIntroduce(User user); //유저페이지 유저소개 수정 .영훈
	
	public int updateProfile(User user); //유저페이지 유저사진 수정 .영훈
	
	public int deleteProfile(int userNo); //유저페이지 유저사진 삭제 .영훈
	

}
