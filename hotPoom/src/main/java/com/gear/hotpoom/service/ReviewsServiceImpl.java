package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Review;

@Service
public class ReviewsServiceImpl implements ReviewsService{
	@Autowired
	private ReviewsDAO reviewsDAO;
	
	
	@Override
	public int register(Review review) {
		return reviewsDAO.insert(review);
	}
	
}
