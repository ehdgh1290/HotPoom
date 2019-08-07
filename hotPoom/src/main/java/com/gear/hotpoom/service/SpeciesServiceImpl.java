package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.SpeciesDAO;
import com.gear.hotpoom.vo.Species;

@Service
public class SpeciesServiceImpl implements SpeciesService{
	
	@Autowired
	private SpeciesDAO speciesDAO;

	@Override
	public List<Species> getList(String name) {
		
		return speciesDAO.selectList(name);
		
	}
	
}
