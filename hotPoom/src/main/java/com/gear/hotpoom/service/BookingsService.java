package com.gear.hotpoom.service;

import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Cancel;

public interface BookingsService {

	//bill
	public Booking getBill(String bookingNo);
	//예약 취소
	public void modifyBooking(Cancel cancel);
	
}