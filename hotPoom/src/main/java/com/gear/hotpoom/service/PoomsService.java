package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import java.util.List;

import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.User;

public interface PoomsService {
	
	public int register(Poom poom, String photoType, String poomImg, String caption);
	
	public int modify(Poom poom);

	public Map<String, Object> getDetail(int no, User loginUser);
	//hot poom
	public List<Poom> getListHP();
	//new poom
	public List<Poom> getListNP();

	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, int userNo);
	
	public Map<String, Object> getCompareCardDetail(int userNo);
}
