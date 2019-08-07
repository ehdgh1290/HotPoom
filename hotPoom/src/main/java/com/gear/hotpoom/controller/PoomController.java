package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.CertsService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;

@Controller
public class PoomController {
	
	@Autowired
	private PoomsService poomsService;
	
	
	//품 등록 페이지로 이동
	@RequestMapping(value="/poom/write",method=RequestMethod.GET)
	public String poomRegisterForm() {
		
		return "poomRegisterForm";
	}
	
	//품 등록
	@RequestMapping(value="/poom", method=RequestMethod.POST)
	public String poomRegister(Poom poom, String photoType, String poomImg,
			String caption) {
		
		System.out.println("품등록 컨트롤러!!");
		
		poomsService.register(poom, photoType, poomImg, caption);
		
		return "redirect:/poom/"+poom.getNo();
	}

}
