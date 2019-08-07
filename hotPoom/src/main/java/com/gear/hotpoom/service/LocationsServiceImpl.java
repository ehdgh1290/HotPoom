package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.LocationsDAO;
import com.gear.hotpoom.vo.Location;

@Service
public class LocationsServiceImpl implements LocationsService {

	@Autowired
	private LocationsDAO locationsDAO;
	
	
	//index location
	@Override
	public List<Location> getList(String location) {
		return locationsDAO.selectList(location);
	}//getList() end
}
