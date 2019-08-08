package com.gear.hotpoom.service;

import java.util.Map;

import com.gear.hotpoom.vo.Booking;

public interface BookingsService {

	public Map<String, Object> getList(int userNo, int pageNo);

	public int register(Booking booking);

}
