package com.gear.hotpoom.service;

import java.util.Map;

import com.gear.hotpoom.vo.Review;

public interface ReviewsService {

	Map<String, Object> getReviewList(int no, int pageNo);
	public int register(Review review);

}
