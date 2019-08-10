package com.gear.hotpoom.service;


import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;

public interface PoomsService {
	
	public int register(Poom poom, String photoType, String poomImg, String caption);
	
	public int modify(Poom poom);

	//hot poom
	public List<Poom> getListHP();
	//new poom
	public List<Poom> getListNP();

	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, int userNo, String mainAddress);
	
}
