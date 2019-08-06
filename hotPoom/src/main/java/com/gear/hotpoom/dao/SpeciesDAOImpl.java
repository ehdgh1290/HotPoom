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
	public List<Species> selectSpeciesName(String name) {
		// TODO Auto-generated method stub
		System.out.println("dao"+name);
		return session.selectList("species.searchSpeciesForPoomList", "%"+name+"%");
	}
	
	//index species autocomplete
	@Override
	public List<Species> selectList(String species) {
		return session.selectList("species.selectList", "%"+species+"%");
	}//selectList() end
}
