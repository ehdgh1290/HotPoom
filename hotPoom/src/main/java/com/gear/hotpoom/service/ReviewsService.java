package com.gear.hotpoom.service;

import java.util.List;

import com.gear.hotpoom.vo.Review;

public interface ReviewsService {

	public List<Review> getPoomReivew(int userNo ,int pageNo); //유저페이지 품리뷰 불러오기 .영훈
	
	public List<Review> getMyReview(int userNo,int pageNo); //유저페이지 내리뷰 불러오기 .영훈
	
}
