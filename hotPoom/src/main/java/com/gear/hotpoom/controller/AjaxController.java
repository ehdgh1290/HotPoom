package com.gear.hotpoom.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gear.hotpoom.service.PetsService;
import com.gear.hotpoom.service.PhotosService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.ReviewsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.util.FileRenameUtil;
import com.gear.hotpoom.util.ResizeImageUtil;
import com.gear.hotpoom.vo.Pet;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.Review;
import com.gear.hotpoom.vo.User;

@RestController
@RequestMapping("/ajax")
public class AjaxController {

	@Autowired
	private PoomsService poomsService;
	@Autowired
	private PhotosService photosService;
	@Autowired
	private ReviewsService reviewsService;
	@Autowired
	private PetsService petsService;
	@Autowired
	private UsersService userService;
	@Autowired
	private ResizeImageUtil resizeImageUtil;
	@Autowired
	private FileRenameUtil fileRenameUtil;
	
	
	@RequestMapping(value="/user/poom", method=RequestMethod.GET)
	public List<Poom> selectPoomList(int userNo,int pageNo){
		 
		 return poomsService.getPoomList(userNo,pageNo);
		 
	}//유저페이지 품 불러오기 .영훈


	@RequestMapping(value="/user/petPhoto", method=RequestMethod.GET)
	public Map<String, Object> selectPetPhoto(int userNo,int pageNo){
		 
		 return photosService.getPetPhotoList(userNo,pageNo);
		 
	}//유저페이지 펫사진 불러오기 .영훈
	
	
	@RequestMapping(value="/user/poomReivew", method=RequestMethod.GET)
	public List<Review> selectPoomReview(int userNo, int pageNo){
		 
		 return reviewsService.getPoomReivew(userNo,pageNo);
		 
	}//유저페이지 품리뷰 불러오기 .영훈
	
	
	@RequestMapping(value="/user/myReivew", method=RequestMethod.GET)
	public List<Review> selectMyReview(int userNo, int pageNo){
		 
		 return reviewsService.getMyReview(userNo,pageNo);
		 
	}//유저페이지 내리뷰 불러오기 .영훈
	
	
	@RequestMapping(value="/user/petProfile", method=RequestMethod.GET)
	public List<Pet> selectPetProfile(int userNo){
		
		 return petsService.getPetProfile(userNo);
		 
	}//유저페이지 펫사진 불러오기 .영훈

	@RequestMapping(value="/user/{userNo}/introduce/{introduce}", method=RequestMethod.PUT)
	public int updateIntroduce( @PathVariable int userNo,@PathVariable  String introduce){

		User user = new User();
		user.setNo(userNo);
		user.setIntroduce(introduce);
		 
		return userService.updateIntroduce(user);
	}//유저페이지 유저소개 수정하기 .영훈
	
	
	@RequestMapping(value="/profile/upload", method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	public String uploadImage(HttpServletRequest request,String type,
			MultipartFile uploadImg,int userNo) {

		ServletContext sc = request.getServletContext();
		
		String uploadPath = sc.getRealPath("upload");
		String profilePath = sc.getRealPath("profile/user");
		String petProfilePath = sc.getRealPath("profile/pet");	
		
		System.out.println(uploadPath);
		
		System.out.println(uploadImg.getOriginalFilename());
		
		File file = null;
		
		if(type.equals("petProfile")) {
			 file = new File(petProfilePath+File.separator+uploadImg.getOriginalFilename()); 
		}else {
			 file = new File(uploadPath+File.separator+uploadImg.getOriginalFilename()); 
		}
			
		file = fileRenameUtil.rename(file);

		try {
			
			uploadImg.transferTo(file);
			
			switch(type) {
			case "Profile" : 
				
				User user = new User();
				user.setNo(userNo);
				user.setProfileImg(file.getName());
				
				userService.updateProfile(user);
				
				resizeImageUtil.resize(file.getAbsolutePath(),profilePath+File.separator+file.getName(), 200);
				
				
				break;
				
			case "Pet" : 
				
				Photo photo = new Photo();
				photo.setContentNo(userNo);
				photo.setImg(file.getName());
				
				photosService.insertPhoto(photo);
				
				
				break;
				
			
			case "petProfile" :
				
				
				resizeImageUtil.resize(file.getAbsolutePath(),petProfilePath+File.separator+file.getName(), 200);
				
			}//switch end
			
			return "{\"src\":\""+ file.getName()+"\"}";
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return "에러";
		} 
		
	}//유저페이지 사진 업로드 .영훈
	
	
	@RequestMapping(value="/profile/user/{userNo}", method=RequestMethod.DELETE)
	public int deleteProfile(@PathVariable int userNo){
		 
		  return userService.deleteProfile(userNo);
		 
		 
	}//유저페이지 프로필사진 지우기 .영훈
	
	
	@RequestMapping(value="/petPhoto/{no}", method=RequestMethod.DELETE)
	public int deletePetPhoto(@PathVariable int no) {
		System.out.println(no);
		return photosService.deletePetPhoto(no);
	}//유저페이지 펫사진 .영훈 
	
	
}
