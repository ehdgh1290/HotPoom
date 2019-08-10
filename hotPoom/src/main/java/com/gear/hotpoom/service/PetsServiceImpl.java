package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.PetsDAO;
import com.gear.hotpoom.vo.Pet;

@Service
public class PetsServiceImpl implements PetsService{

	@Autowired
	private PetsDAO petsDAO;
	
	@Override
	public List<Pet> getPetProfile(int userNo) {
		return petsDAO.selectProfileList(userNo);
	} //유저페이지 펫프로필 불러오기 .영훈
	
	@Override
	public int insertPet(Pet pet) {
		return petsDAO.insert(pet);
	}//유저페이지 펫추가 하기 .영훈
	
	@Override
	public int deleteMyPet(int no) {
		return petsDAO.deleteMyPet(no);
	}
	
	@Override
	public Pet selectMyPet(int myPetNo) {
		return  petsDAO.selectMyPet(myPetNo);
	}
	
	@Override
	public int updatePet(Pet pet) {
		return petsDAO.updatePet(pet);
	}
	
}
