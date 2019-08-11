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
import com.gear.hotpoom.service.PhotosService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.User;

@Controller
public class PoomController {
	
	@Autowired
	private PoomsService poomsService;
	@Autowired
	private PhotosService photosService;
	
	
	//품 등록 페이지로 이동
	@RequestMapping(value="/poom/register",method=RequestMethod.GET)
	public String poomRegisterForm() {
		
		return "poomRegisterForm";
	}
	
	//품 수정 완료
	@RequestMapping(value="/poom/update",method=RequestMethod.POST)
	public String poomUdate(Poom poom, String[] poomImg, String[] caption, String mainImg, String mainCaption) {
		
		
		
		
		return "redirect:/poom/"+poom.getNo();
	}
	
	//품 수정 페이지로 이동
	@RequestMapping(value="/poom/update/{poomNo}",method=RequestMethod.GET)
	public String poomUdate(@PathVariable int poomNo,Model model) {
		model.addAttribute("poom",poomsService.getPoomInfo(poomNo));
		model.addAttribute("mainPhoto",photosService.getMainPhoto(poomNo));
		model.addAttribute("subPhotoList",photosService.getSubPhotoList(poomNo));
		
		return "poomRegisterForm";
	}
	
	//품 등록
	@RequestMapping(value="/poom", method=RequestMethod.POST)
	public String poomRegister(Poom poom, String[] poomImg, String[] caption, String mainImg, String mainCaption) {	
	System.out.println("품등록 컨트롤러!!");
	
		poomsService.register(poom);

		Photo photo = new Photo();
		photo.setImg(mainImg);
		photo.setCaption(mainCaption);
		photo.setType("M");
		photo.setContentNo(poom.getNo());
		
		photosService.register(photo);
		
		photo.setType("S");
		int i = 0;
		for(String img : poomImg) {
			photo.setImg(img);
			photo.setCaption(caption[i]);
			photosService.register(photo);
			i++;
		};//for end
		
		return "redirect:/poom/"+poom.getNo();
	}


	//동호, poomDetail 기본 정보 가져오기(리뷰제외)
	@RequestMapping(value="/poom/{no}",method=RequestMethod.GET)
	public String poomDetail(@PathVariable int no, Model model, HttpSession session) {
		
		model.addAllAttributes(poomsService.getDetail(no, (User)session.getAttribute("loginUser")));
		
		return "poomDetail";
	}
	
	
	@RequestMapping(value="/poom/species/{speciesNo}/address/{mainAddress}/pet/{petCnt}", method=RequestMethod.GET)
	public String getPoomList(@PathVariable int speciesNo, @PathVariable String mainAddress, @PathVariable int petCnt) {
		return "hotelList";
	}
	

}
