package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Review;

public interface ReviewsDAO {

	public int isReview(String bookingNo);
	public int insert(Review review);
	public List<Review> selectList(PageVO pageVO);
	public int selectTotalByPoom(int poomNo);
}
