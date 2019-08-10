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
	public int isReport(int reviewNo) {
		return reportsDAO.selectReport(reviewNo);
	}
	
	@Override
	public int register(Report report) {
		return reportsDAO.insert(report);
	}

	
}
