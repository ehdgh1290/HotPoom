package com.gear.hotpoom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.BanksService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.CertsService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.User;

@Controller
public class PoomController {
	
	@Autowired
	private PoomsService service;
	
	
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
		
		service.register(poom, photoType, poomImg, caption);
		
		return "redirect:/poom/"+poom.getNo();
	}


	//동호, poomDetail 기본 정보 가져오기(리뷰제외)
	@RequestMapping(value="/poom/{no}",method=RequestMethod.GET)
	public String poomDetail(@PathVariable int no, Model model, HttpSession session) {
		
		model.addAllAttributes(service.getDetail(no, (User)session.getAttribute("loginUser")));
		
		return "poomDetail";
	}
	
	
	@RequestMapping(value="/poom", method=RequestMethod.GET)
	public String getPoomList() {
		return "hotelList";
	}

}
