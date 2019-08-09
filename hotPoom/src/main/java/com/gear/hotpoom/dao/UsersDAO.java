package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.User;

public interface UsersDAO {

	public User selectOne(int userNo); // 유저페이지에서 유저정보 불러오기 .영훈
	
	public int updateIntroduce(User user); //유저페이지 자기소개 수정하기 .영훈
	
	public int updateProfile(User user); //유저페이지 프로필 사진 바꾸기 .영훈
	
	public int deleteProfile(int userNo); //유저페이지 프로필 사진 제거 .영훈
} 
