package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.PageVO;

@Repository
public class BookingsDAOImpl implements BookingsDAO{
	@Autowired
	private SqlSession session;
	
	
	@Override //booking 페이지 볼 때 기간이 지난 것 F로 바꿈
	public int updateState(Booking booking) {
		return session.update("updateState", booking);
	}
	
	@Override //예약 수 가져옴
	public int selectTotal(int userNo) {
		return session.selectOne("selectTotal",userNo);
	}
	
	@Override //동호, 예약 리스트를 가져옴
	public List<Booking> selectList(PageVO pageVO) {
		return session.selectList("selectList",pageVO);
	}
	
}
