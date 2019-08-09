package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Pet;

public interface PetsDAO {

	public List<Pet> selectProfileList(int userNo);//유저페이지 펫프로필들 불러오기 .영훈
	
	public int insert(Pet pet);//유저페이지 펫 추가  .영훈
}
