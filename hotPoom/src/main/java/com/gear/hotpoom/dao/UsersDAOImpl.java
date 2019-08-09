package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.User;

@Repository
public class UsersDAOImpl implements UsersDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public User selectOne(int userNo) {
		return session.selectOne("users.selectUserInfo",userNo);
	}// 유저페이지에서 정보 불러오기 .영훈
	
	@Override
	public int updateIntroduce(User user) {
		return session.update("users.updateIntroduce",user);
	} //유저페이지 자기소개 수정 .영훈

	@Override
	public int updateProfile(User user) {
		return session.update("users.updateProfile",user);
	} //유저페이지 프로필 바꾸기 .영훈
	
	@Override
	public int deleteProfile(int userNo) {
		return session.delete("users.deleteProfile",userNo);
	} //유저페이지 프로필사진 삭제하기 .영훈
	
	
}
