package com.gear.hotpoom.dao;


import java.util.List;

import com.gear.hotpoom.vo.Photo;


public interface PhotosDAO {
	
	public int insert(Photo photo);
	
	public int update(Photo photo);

	public Photo selectMainPhoto(int poomNo);

	public List<Photo> selectSubPhotoList(int poomNo);

	
}
