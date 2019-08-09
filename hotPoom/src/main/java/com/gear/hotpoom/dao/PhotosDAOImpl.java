package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Photo;

@Repository
public class PhotosDAOImpl implements PhotosDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Photo> selectList(PageVO pageVO) {
		return session.selectList("photos.getPetPhotoList",pageVO);
	} //유저페이지 펫사진 불러오기 .영훈
	
	@Override
	public int insetPhoto(Photo photo) {
		System.out.println(photo.getImg());
		return session.insert("photos.insertPhoto",photo);
	} //유저페이지 펫사진 추가 .영훈
	
	@Override
	public int deletePhoto(int no) {
		System.out.println(no);
		return session.delete("photos.deletePhoto",no);
	} //유저페이지 펫사진 삭제 .영훈
}
