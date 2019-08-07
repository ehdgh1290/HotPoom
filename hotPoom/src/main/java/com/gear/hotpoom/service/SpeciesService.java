package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.Species;

public interface SpeciesService {
	
	public List<Species> getList(String species);
	
	public Map<String, Object> searchSpeciesName(String name);
	
}
