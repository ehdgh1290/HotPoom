package com.gear.hotpoom.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.gear.hotpoom.vo.Photo;

@Repository
public class PhotosDAOImpl implements PhotosDAO{
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Photo> selectSubPhotoList(int poomNo) {
		return session.selectList("photos.selectSubPhotoList", poomNo);
	}
	
	@Override
	public Photo selectMainPhoto(int poomNo) {
		return session.selectOne("photos.selectMainPhoto", poomNo);
	}
	
	@Override
	public int insert(Photo photo) {
		return session.insert("photos.insert",photo);
	}
	
	@Override
	public int update(Photo photo) {
		return session.update("photos.update",photo);
	}

}
