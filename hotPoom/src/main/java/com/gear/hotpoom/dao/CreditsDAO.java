package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Credit;

public interface CreditsDAO {

	public int insertCard(Credit credit);
	public int deleteCard(int cardNo);
	public int beforeCardUpdate(int no);
	public int afterCardUpdate(int no);
	public List<Credit> selectCardDefault(int userNo);
	public List<Credit> selectCardList(int userNo);
	public int insertBasicCard(Credit credit);
	
}
