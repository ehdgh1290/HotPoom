package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Cancel;

@Repository
public class CancelsDAOImpl implements CancelsDAO{
	
	@Autowired
	private SqlSession session;
	
	
	//예약 취소 
	@Override
	public int insertBooking(Cancel cancel) {
		return session.insert("cancels.bookingCancel", cancel);
	}//insertBooking() end
	
}
