package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Booking;

@Repository
public class PaymentsDAOImpl implements PaymentsDAO{
	@Autowired
	private SqlSession session;
	
	@Override //poomDetail에서 예약했을 때 결제 추가
	public int insert(Booking booking) {
		return session.insert("payments.insert", booking);
	}
	
}
