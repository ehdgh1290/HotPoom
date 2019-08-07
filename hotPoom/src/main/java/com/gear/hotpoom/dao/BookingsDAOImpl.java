package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Booking;

@Repository
public class BookingsDAOImpl implements BookingsDAO{
	@Autowired
	private SqlSession session;
	
	
	//bill
	@Override
	public Booking selectBill(String bookingNo) {
		return session.selectOne("bookings.selectBill", bookingNo);
	}//selectBill() end
	
	//예약 취소
	@Override
	public int updateBooking(String no) {
		return session.update("bookings.updateBooking", no);
	}//updateBooking() end
	
}
