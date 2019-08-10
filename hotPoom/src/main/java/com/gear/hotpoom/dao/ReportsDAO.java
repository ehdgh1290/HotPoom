package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.Report;


public interface ReportsDAO {
	
	public int selectReport(int no);
	public int insert(Report report);

}
