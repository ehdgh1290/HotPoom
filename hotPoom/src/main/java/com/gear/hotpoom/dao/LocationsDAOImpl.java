package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Location;

@Repository
public class LocationsDAOImpl implements LocationsDAO {

	@Autowired
	private SqlSession session;
	
	
	//index location
	@Override
	public List<Location> selectList(String location) {
		return session.selectList("locations.selectList", "%"+location+"%");
	}//selectList() end
	
}
