package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.PetsService;
import com.gear.hotpoom.vo.Pet;

@Controller
public class PetController {
	
	@Autowired
	private PetsService petsService;

	@RequestMapping(value="/pet",method=RequestMethod.POST)
	public String addPet(Pet pet) {
			
		petsService.insertPet(pet);
		
		int userNo = pet.getUserNo(); 
		
		return "redirect:/userPage/"+userNo;
	} //유저페이지 펫추가하기 .영훈
	
	
	
	@RequestMapping(value="/pet",method=RequestMethod.PUT)
	public String updatePet(Pet pet) {
			
		petsService.updatePet(pet);
		
		int userNo = pet.getUserNo(); 
		
		return "redirect:/userPage/"+userNo;
	} //유저페이지 펫추가하기 .영훈
	


}


	
	
	





