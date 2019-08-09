package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Review;

public interface ReviewsDAO {

	public List<Review> myPoomReviewtList(PageVO pageVO); //유저페이지 품리뷰 불러오기 .영훈
	
	public List<Review> myReviewList(PageVO pageVO); //유저페이지 내리뷰 불러오기 .영훈
	
}
