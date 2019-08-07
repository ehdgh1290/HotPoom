package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BookingsDAO;
import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.dao.CancelsDAO;
import com.gear.hotpoom.vo.Cancel;


@Service
public class BookingsServiceImpl implements BookingsService{
	
	@Autowired
	private BookingsDAO bookingsDAO;
	@Autowired
	private ReviewsDAO reviewsDAO; 
	@Autowired
	private PaginateUtil paginateUtil;
	@Autowired
	private CancelsDAO cancelsDAO;
	
	@Override //동호, 리스트 가져옴
	public Map<String, Object> getList(int userNo, int pageNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 5;
		PageVO pageVO = new PageVO(pageNo, numPage);
		pageVO.setNo(userNo);
		List<Booking> list = bookingsDAO.selectList(pageVO);
		//기간이 지난것 중 리뷰를 쓴 것이 있는지
		for(Booking booking : list) {
			System.out.println("bookingNo:"+booking.getNo());
			int type = bookingsDAO.updateState(booking);
			System.out.println("type:"+type);
			if(type==1) {
				booking.setUserState("F");
				booking.setHostState("F");
			}
			booking.setIsReview(reviewsDAO.isReview(booking.getNo())==1);
		}
		map.put("bookingList", list);
		
		int numBlock = 5;
		int total = bookingsDAO.selectTotal(userNo);
				
		map.put("paginate", paginateUtil.getPaginate(pageNo, total, numPage, numBlock, "/booking"));
		
		return map;
	}


	
	//bill
	@Override
	public Booking getBill(String bookingNo) {
		return bookingsDAO.selectBill(bookingNo);
	}//getBill() end
	
	
	//예약 취소
	@Override
	public void modifyBooking(Cancel cancel) {
		
		bookingsDAO.updateBooking(cancel.getBookingNo());
		cancelsDAO.insertBooking(cancel);
		
	}//modifyBooking() end
}
