package com.gear.hotpoom.service;


import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.util.ResizeImageUtil;
import com.gear.hotpoom.vo.Photo;


import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Photo;

@Service
public class PhotosServiceImpl implements PhotosService{
	
	@Autowired
	private PhotosDAO photosDAO;
	@Autowired
	private ResizeImageUtil resizeImageUtil;
	
	@Override
	public String upload(HttpServletRequest request, MultipartFile poomImg,
			String type, HttpSession session) {
		//1. 실제 경로 얻기
		ServletContext application = request.getServletContext();
		//2. 루트 경로 얻어옴
		String root = application.getRealPath("");
		System.out.println(root);
		//3. upload 폴더 경로 및 profile 폴더 경로
		System.out.println("");
		String uploadPath = root+"upload"+File.separator;
		System.out.println("업로드폴더 경로"+uploadPath);
		System.out.println("");
		String poomImgPath = root+"img"+File.separator+"poom"+File.separator;
		System.out.println("품 이미지 폴더 경로"+poomImgPath);
		//4. file rename 처리
		System.out.println(poomImg.getOriginalFilename());
		
		String rename = UUID.randomUUID().toString()+poomImg.getOriginalFilename();
				
		
		//5. 경로+파일명
		String fullPath=uploadPath+rename;
		
		//6. 이동할 파일을 생성
		File file = new File(fullPath);
		
		System.out.println("type: "+type);
		
		if(type.equals("M")) {
			try {
				poomImg.transferTo(file);//업로드 폴더로 이동
				resizeImageUtil.resize(fullPath, poomImgPath+rename, 1100,600);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(type.equals("S")){
			try {
				poomImg.transferTo(file);//업로드 폴더로 이동
				resizeImageUtil.resize(fullPath, poomImgPath+rename, 900,800);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(type.equals("A")){
			try {
				poomImg.transferTo(file);//업로드 폴더로 이동
				resizeImageUtil.resize(fullPath, poomImgPath+rename, 500,400);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		Photo photo = new Photo();
		//photo.setNo(no);
		//photo.setProfileImage(rename);
		
		//photosDAO.insert(photo);

		
		return "{\"fileName\":\""+rename+"\"}";
	}
	
	@Override
	public int modify(Photo photo) {
		photosDAO.update(photo);				
		return 1;
	}
	


	@Autowired
	private PhotosDAO photosDAO;

	
	
	@Override
	public Map<String,Object> getPetPhotoList(int userNo, int pageNo) {
		Map<String,Object> map = new ConcurrentHashMap<String, Object>();
		PageVO pageVO = new PageVO(pageNo,9);
		pageVO.setUserNo(userNo);
		
		map.put("Photos", photosDAO.selectList(pageVO));
		
		
		return map;
	} //유저페이지 펫사진 불러오기 .영훈
	
	@Override
	public int insertPhoto(Photo photo) {
		return photosDAO.insetPhoto(photo);
	} //유저페이지 펫사진 추가하기 .영훈
	
	@Override
	public int deletePetPhoto(int no) {
		System.out.println(no);
		return photosDAO.deletePhoto(no);
	} //유저페이지 펫사진 삭제하기 .영훈
	


	
}
