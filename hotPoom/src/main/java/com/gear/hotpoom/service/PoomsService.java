package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.User;

public interface PoomsService {
	
	public int register(Poom poom);
	
	public int modify(Poom poom);

	public Map<String, Object> getDetail(int no, User loginUser);
	//hot poom
	public List<Poom> getListHP();
	//new poom
	public List<Poom> getListNP();

	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, int userNo, String mainAddress);

	public List<Poom> getPoomList(int userNo, int pageNo); //유저페이지 품리스트 불러오기 .영훈
	
	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort);

	public Object getPoomInfo(int no);
	
	public Map<String, Object> getCompareCardDetail(int userNo);
}
