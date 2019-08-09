package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.Poom;

public interface PoomsService {

	public List<Poom> getPoomList(int userNo, int pageNo); //유저페이지 품리스트 불러오기 .영훈
	
	
}
