package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Review> myPoomReviewtList(PageVO pageVO) {
		return session.selectList("reviews.selectPoomList",pageVO);
	} //유저페이지 품리뷰 불러오기 .영훈
	
	@Override
	public List<Review> myReviewList(PageVO pageVO) {
		return session.selectList("reviews.selectMyList",pageVO);
	} //유저페이지 내리뷰 불러오기 .영훈
	
	
}
