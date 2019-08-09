package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Pet;

public interface PetsDAO {
	
	public List<Pet> selectPetListByUserNo(int userNo);
}
