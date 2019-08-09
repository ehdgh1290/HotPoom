package com.gear.hotpoom.service;

import java.util.Map;

import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Cancel;


public interface BookingsService {
	
	public Map<String, Object> getList(int userNo, int pageNo);
	
	//bill
	public Booking getBill(String bookingNo);
	//예약 취소
	public void modifyBooking(Cancel cancel);
	
	public int register(Booking booking);

}
