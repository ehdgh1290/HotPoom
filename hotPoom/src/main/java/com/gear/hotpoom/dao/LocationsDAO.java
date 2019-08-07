package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Location;

public interface LocationsDAO {
	
	//index 위치
	public List<Location> selectList(String location);

}
