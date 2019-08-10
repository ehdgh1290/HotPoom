package com.gear.hotpoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gear.hotpoom.service.CertsService;
import com.gear.hotpoom.service.PhotosService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;

@Controller
public class PoomController {
	
	@Autowired
	private PoomsService poomsService;
	@Autowired
	private PhotosService photosService;
	
	
	//품 등록 페이지로 이동
	@RequestMapping(value="/poom/write",method=RequestMethod.GET)
	public String poomRegisterForm() {
		
		return "poomRegisterForm";
	}
	
	
	@RequestMapping(value="/poom/update/{poomNo}",method=RequestMethod.GET)
	public String poomUdate(@PathVariable int no,Model model) {
		model.addAttribute("poom",poomsService.getPoomInfo(no));
		model.addAttribute("mainPhoto",photosService.getMainPhoto(no));
		model.addAttribute("subPhotoList",photosService.getSubPhotoList(no));
		
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

}
