package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.Booking;

public interface BookingsDAO {

	//bill
	public Booking selectBill(String bookingNo);
	//예약 취소
	public int updateBooking(String no);
	
}
