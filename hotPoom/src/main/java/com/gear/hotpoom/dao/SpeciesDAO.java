package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Species;

public interface SpeciesDAO {
	

	public List<Species> selectList(String species);
	
}
