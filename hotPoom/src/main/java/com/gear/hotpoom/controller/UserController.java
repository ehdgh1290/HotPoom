package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.PetsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.Pet;

@Controller
public class UserController {

	@Autowired
	private UsersService userService;
	@Autowired
	private PetsService petsService;
	
	@RequestMapping(value="/userPage/{userNo}",method=RequestMethod.GET)
	public String userPage(@PathVariable int userNo, Model model) {
			
		model.addAllAttributes(userService.getUserInfo(userNo));
		
		return "userPage";
	} //유저페이지 기본 정보 불러오기 .영훈
	
	@RequestMapping(value="/pet",method=RequestMethod.POST)
	public String addPet(Pet pet,@RequestHeader String referer) {
			
		petsService.insertPet(pet);
		
		int userNo = pet.getUserNo(); 
		
		return "redirect:/userPage/"+userNo;
	} //유저페이지 펫추가하기 .영훈
	

	
	
	
}



