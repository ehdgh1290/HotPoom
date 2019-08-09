package com.gear.hotpoom.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.PetsDAO;
import com.gear.hotpoom.dao.UsersDAO;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.User;

@Service
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDAO usersDAO;
	@Autowired
	private PetsDAO petsDAO;
	
	
	@Override
	public Map<String, Object> getUserInfo(int userNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("userInfo", usersDAO.selectOne(userNo));
		map.put("userPetInfo", petsDAO.selectProfileList(userNo));
		
		
		return map;
	}// 유저페이지에서 정보 불러오기 .영훈
	
	@Override
	public int updateIntroduce(User user) {
		return usersDAO.updateIntroduce(user);
	} //유저페이지 유저소개 수정 .영훈
	
	@Override
	public int updateProfile(User user) {
		return usersDAO.updateProfile(user);
	} //유저페이지 프로필 사진 수정 .영훈
	
	@Override
	public int deleteProfile(int userNo) {
		return usersDAO.deleteProfile(userNo);
	} //유저페이지 프로필 사진 삭제 .영훈
	
}
