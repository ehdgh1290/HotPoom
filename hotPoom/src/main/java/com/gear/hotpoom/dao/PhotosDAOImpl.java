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
	
	@Override //동호, 품 사진들 가져오기
	public List<Photo> selectPoomPhotos(int poomNo) {
		return session.selectList("photos.selectPoomPhotos", poomNo);
	}
	
}
