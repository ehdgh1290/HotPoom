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
	public int registerBasicCard(Credit credit) {
		return creditsDAO.insertBasicCard(credit);
	}
	
	@Override
	public List<Credit> getMyCardDefault(int userNo) {
		return creditsDAO.selectCardDefault(userNo);
	}
	
}
