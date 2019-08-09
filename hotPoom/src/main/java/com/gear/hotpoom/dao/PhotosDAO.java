package com.gear.hotpoom.dao;

import java.util.List;
import com.gear.hotpoom.vo.Photo;

import com.gear.hotpoom.vo.Photo;


public interface PhotosDAO {
	
	public int insert(Photo photo);
	
	public int update(Photo photo);
	
	public List<Photo> selectPoomPhotos(int poomNo);

	
}
