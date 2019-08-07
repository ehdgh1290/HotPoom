package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Photo;

@Repository
public class PhotosDAOImpl implements PhotosDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Photo photo) {
		return session.insert("photos.insert",photo);
	}
	
	@Override
	public int update(Photo photo) {
		return session.update("photos.update",photo);
	}
	
	
}
