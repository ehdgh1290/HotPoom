package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Species;

@Repository
public class SpeciesDAOImpl implements SpeciesDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Species> selectList(String name) {
		return session.selectList("species.searchSpeciesForPoomList","%"+name+"%");
	}
	
	
}
