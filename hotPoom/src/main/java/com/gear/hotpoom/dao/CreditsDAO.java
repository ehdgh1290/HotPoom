package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Credit;

public interface CreditsDAO {

	public List<Credit> selectCardList(int userNo);
	public List<Credit> selectCardDefault(int userNo);
	public int insertBasicCard(Credit credit);
	
}
