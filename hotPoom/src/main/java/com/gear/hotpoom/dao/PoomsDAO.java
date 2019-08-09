package com.gear.hotpoom.dao;

import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Poom;

public interface PoomsDAO {

	public List<Poom> selectList(PageVO pageVO); // 유저페이지 품리스트 불러오기 .영훈
	
}
