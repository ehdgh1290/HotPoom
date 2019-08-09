package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BanksDAO;
import com.gear.hotpoom.vo.Bank;

@Service
public class BanksServiceImpl implements BanksService{
	@Autowired
	private BanksDAO banksDAO;
	
	@Override
	public List<Bank> getCardList() {
		return banksDAO.selectCardList();
	}
}
