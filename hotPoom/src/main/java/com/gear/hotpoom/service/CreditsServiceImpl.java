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
	
}
