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
	
	@Override //품에서 리뷰 갯수 불러옴
	public int selectTotalByPoom(int poomNo) {
		return session.selectOne("reviews.selectTotalByPoom", poomNo);
	}
	
	@Override //품에서 리뷰 리스트 불러옴
	public List<Review> selectList(PageVO pageVO) {
		return session.selectList("reviews.selectReviewListByPoom", pageVO);
	}
	
	
	@Override //동호, 리뷰가 있는지 확인
	public int isReview(String bookingNo) {
		return session.selectOne("reviews.selectIsReview",bookingNo);
	}
	
	@Override
	public int insert(Review review) {
		return session.insert("reviews.insert", review);
	}
	
}
