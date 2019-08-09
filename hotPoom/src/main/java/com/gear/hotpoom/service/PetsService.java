package com.gear.hotpoom.service;

import java.util.List;

import com.gear.hotpoom.vo.Pet;

public interface PetsService {

	public List<Pet> getPetProfile(int userNo); //유저페이지 펫프로필 불러오기 .영훈
	
	public int insertPet(Pet pet); //유저페이지 펫 추가 불러오기 .영훈
	
}
