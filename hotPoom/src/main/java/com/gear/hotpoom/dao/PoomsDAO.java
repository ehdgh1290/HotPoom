package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.PageVO;

import com.gear.hotpoom.vo.Poom;

public interface PoomsDAO {
	
	public int insert(Poom poom);

	//hot poom
	public List<Poom> selectListHP();
	//new poom
	public List<Poom> selectListNP();
	public List<Poom> selectPoomList(PageVO pageVO);
	public int selectPoomListTotal(PageVO pageVO);
	public int update(Poom poom);
	public Object selectPoomInfo(int no);

}
