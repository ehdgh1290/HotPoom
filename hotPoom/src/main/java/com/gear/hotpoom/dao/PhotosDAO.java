package com.gear.hotpoom.dao;

import java.util.List;
import com.gear.hotpoom.vo.Photo;

public interface PhotosDAO {
	
	public List<Photo> selectPoomPhotos(int poomNo);

	
}
