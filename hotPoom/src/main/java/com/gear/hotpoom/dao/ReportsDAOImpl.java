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
	public int insert(Report report) {
		System.out.println(report);
		System.out.println(report.getUserNo());
		System.out.println(report.getReviewNo());
		System.out.println(report.getType());
		return session.insert("reports.insert",report);
	}//유저페이지 신고하기 .영훈
	
	
	@Override
	public int selectReport(int reviewNo) {
		return session.selectOne("reports.selectReport",reviewNo);
	}
	
	@Override
	public int insert(Report report) {
		return session.insert("reports.insert",report);
	}
	
}
