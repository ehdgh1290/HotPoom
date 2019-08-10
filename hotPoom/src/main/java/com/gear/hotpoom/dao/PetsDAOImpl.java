package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Pet;

@Repository
public class PetsDAOImpl implements PetsDAO{
	@Autowired
	private SqlSession session;
	
	@Override

	public List<Pet> selectPetListByUserNo(int userNo) {
		return session.selectList("selectPetListByUserNo", userNo);
	}

	public List<Pet> selectProfileList(int userNo) {
		return session.selectList("pets.selectPetList",userNo);
	}// 유저페이지에서 펫프로필 불러오기 .영훈
	
	@Override
	public int insert(Pet pet) {
		return session.insert("pets.insert",pet);
	}//유저페이지 펫추가 .영훈

	
}
