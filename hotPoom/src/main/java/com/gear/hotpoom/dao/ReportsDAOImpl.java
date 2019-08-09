package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Report;

@Repository
public class ReportsDAOImpl implements ReportsDAO{
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int selectReport(int reviewNo) {
		return session.selectOne("reports.selectReport",reviewNo);
	}
	
	@Override
	public int insert(Report report) {
		return session.insert("reports.insert",report);
	}
	
}
