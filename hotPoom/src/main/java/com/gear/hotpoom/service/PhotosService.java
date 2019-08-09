package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.Photo;

public interface PhotosService {

	public Map<String,Object> getPetPhotoList(int userNo, int pageNo); //유저페이지 펫사진 불러오기 .영훈

	public int insertPhoto(Photo photo); //유저페이지 펫사진 추가하기  .영훈
	
	public int deletePetPhoto(int no); //유저페이지 펫사진 삭제하기 .영훈
	

	
}
