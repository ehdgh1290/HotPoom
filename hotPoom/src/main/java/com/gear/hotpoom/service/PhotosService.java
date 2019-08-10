package com.gear.hotpoom.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import com.gear.hotpoom.vo.Photo;
import java.util.List;
import java.util.Map;




public interface PhotosService {
	
	public String upload(HttpServletRequest request,
						MultipartFile poomImg, String type,HttpSession session);
	
	public int modify(Photo photo);


	public Map<String,Object> getPetPhotoList(int userNo, int pageNo); //유저페이지 펫사진 불러오기 .영훈

	public int insertPhoto(Photo photo); //유저페이지 펫사진 추가하기  .영훈
	
	public int deletePetPhoto(int no); //유저페이지 펫사진 삭제하기 .영훈
	

}
