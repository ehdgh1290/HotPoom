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
	
}
