package com.gear.hotpoom.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gear.hotpoom.service.PhotosService;
import com.gear.hotpoom.service.SpeciesService;
import com.gear.hotpoom.vo.Species;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	private SpeciesService speciesService;
	
	@Autowired
	private PhotosService photosService;
	

	@RequestMapping(value= {"species/{name}","species"}, method=RequestMethod.GET)
	public List<Species> species(@PathVariable(required=false,value="") String name){
		//System.out.println(name);
		return speciesService.getList(name);
	}
	
	//품 메인사진 보이기
	@RequestMapping(value="poom/mainImg/upload",
			method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String uploadPoomMainImg(HttpServletRequest request,MultipartFile poomImg,
			String type, HttpSession session) {
		return photosService.upload(request,poomImg,type,session);
	}
	
	//품 서브사진 보이기
	@RequestMapping(value="poom/subImg/upload",
			method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String uploadPoomSubImg(HttpServletRequest request,MultipartFile poomImg,
			String type, HttpSession session) {
		return photosService.upload(request,poomImg,type,session);
	}
	
	//품 에디터사진 보이기
	@RequestMapping(value="poom/editorImg/upload",
			method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String uploadPoomEditorImg(HttpServletRequest request,MultipartFile poomImg,
			String type, HttpSession session) {
		return photosService.upload(request,poomImg,type,session);
	}
	
	

}
