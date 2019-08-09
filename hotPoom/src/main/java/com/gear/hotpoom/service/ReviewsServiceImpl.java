package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Review;

@Service
public class ReviewsServiceImpl implements ReviewsService{

	@Autowired
	private ReviewsDAO reviewsDAO;
	
	
	
	@Override
	public List<Review> getPoomReivew(int userNo,int pageNo) {
		PageVO pageVO = new PageVO(pageNo,3);
		pageVO.setUserNo(userNo);
		
		
		return reviewsDAO.myPoomReviewtList(pageVO);
	}//유저페이지 품리뷰 불러오기 .영훈
	
	@Override
	public List<Review> getMyReview(int userNo,int pageNo) {
		PageVO pageVO = new PageVO(pageNo,3);
		pageVO.setUserNo(userNo);
		
		
		return reviewsDAO.myReviewList(pageVO);
	}//유저페이지 내리뷰 불러오기 .영훈
	
}
