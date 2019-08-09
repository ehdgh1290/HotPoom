package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.CreditsDAO;
import com.gear.hotpoom.vo.Credit;

@Service
public class CreditsServiceImpl implements CreditsService{
	@Autowired
	private CreditsDAO creditsDAO;
	
	@Override
	public List<Credit> getMyCardList(int userNo) {
		return creditsDAO.selectCardList(userNo);
	}
	
	@Override
	public int addCard(Credit credit) {
		return creditsDAO.insertCard(credit);
	}
	
	@Override
	public int removeCard(int cardNo) {
		return creditsDAO.deleteCard(cardNo);
	}
	
	@Override
	public int setDefault(int userNo, int cardNo) {
		creditsDAO.beforeCardUpdate(userNo);
		creditsDAO.afterCardUpdate(cardNo);
		return 11;
		
	public int registerBasicCard(Credit credit) {
		return creditsDAO.insertBasicCard(credit);
	}
	
	@Override
	public List<Credit> getMyCardDefault(int userNo) {
		return creditsDAO.selectCardDefault(userNo);
	}
	
}
