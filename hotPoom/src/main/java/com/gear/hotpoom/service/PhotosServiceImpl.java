package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Photo;

@Service
public class PhotosServiceImpl implements PhotosService{

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
