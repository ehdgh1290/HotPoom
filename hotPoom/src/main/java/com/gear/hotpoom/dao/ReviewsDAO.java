package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.Review;

public interface ReviewsDAO {

	public int isReview(String bookingNo);
	public int insert(Review review);
}
