package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Bank;

public interface BanksDAO {
	
	public List<Bank> selectCardList();
}
