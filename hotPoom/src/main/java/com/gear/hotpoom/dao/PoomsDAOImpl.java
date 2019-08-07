package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Poom;

@Repository
public class PoomsDAOImpl implements PoomsDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Poom poom) {
		return session.insert("pooms.insert",poom);
	}
	
	@Override
	public int update(Poom poom) {
		return session.update("pooms.update",poom);
	}
	
	
}
