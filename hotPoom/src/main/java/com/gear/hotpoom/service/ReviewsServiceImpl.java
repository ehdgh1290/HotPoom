package com.gear.hotpoom.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Review;

@Service
public class ReviewsServiceImpl implements ReviewsService{
	@Autowired
	private ReviewsDAO reviewsDAO;
	@Autowired
	private PaginateUtil paginateUtil;
	
	
	@Override
	public Map<String, Object> getReviewList(int no, int pageNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		int numPage = 4;
		PageVO pageVO = new PageVO(pageNo, numPage, no);
		
		map.put("reviewList", reviewsDAO.selectList(pageVO));
		
		int total = reviewsDAO.selectTotalByPoom(no);
		int numBlock = 3;
		
		map.put("paginate", paginateUtil.getPaginate(pageNo, total, numPage, numBlock, "/poom/"+no+"/review"));
		
		return map;
	}
	
	public int register(Review review) {
		return reviewsDAO.insert(review);
	}
	
}
