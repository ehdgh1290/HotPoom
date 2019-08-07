package com.gear.hotpoom.service;

import java.util.List;

import com.gear.hotpoom.vo.Location;

public interface LocationsService {
	
	//index location
	public List<Location> getList(String location);

}
