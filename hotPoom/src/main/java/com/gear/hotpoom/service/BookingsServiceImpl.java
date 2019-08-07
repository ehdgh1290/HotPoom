package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BookingsDAO;
import com.gear.hotpoom.dao.CancelsDAO;
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Cancel;

@Service
public class BookingsServiceImpl implements BookingsService{

	@Autowired
	private BookingsDAO bookingsDAO;
	@Autowired
	private CancelsDAO cancelsDAO;
	
	
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
