package com.gear.hotpoom.dao;

import java.util.List;

import java.util.List;

import com.gear.hotpoom.vo.Photo;

import com.gear.hotpoom.vo.PageVO;



public interface PhotosDAO {
	
	public int insert(Photo photo);
	
	public int update(Photo photo);
	
	public List<Photo> selectPoomPhotos(int poomNo);

	public List<Photo> selectList(PageVO pageVO);//유저페이지 펫사진 불러오기 .영훈
	
	public int insetPhoto(Photo photo);//유저페이지 펫사진 추가 .영훈
	
	public int deletePhoto(int no);//유저페이지 펫사진 삭제 .영훈

	public Photo selectMainPhoto(int poomNo);

	public List<Photo> selectSubPhotoList(int poomNo);

	
	
	public List<Photo> getPoomCardPhoto(int poomNo);
	
}
