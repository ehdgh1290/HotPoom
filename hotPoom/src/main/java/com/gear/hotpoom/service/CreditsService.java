package com.gear.hotpoom.service;

import java.util.List;

import com.gear.hotpoom.vo.Credit;

public interface CreditsService {

	public List<Credit> getMyCardList(int userNo);
	public int addCard(Credit credit);
	public int removeCard(int cardNo);
	public int setDefault(int userNo, int cardNo);
	public List<Credit> getMyCardDefault(int userNo);
	public int registerBasicCard(Credit credit);
	
}
