package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.ReportsDAO;
import com.gear.hotpoom.vo.Report;

@Service
public class ReportsServiceImpl implements ReportsService{
	@Autowired
	private ReportsDAO reportsDAO;
	
	@Override
	public int insert(Report report) {

		return reportsDAO.insert(report);
		
	} //유저페이지 신고하기 .영훈
	
}
