package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Bank;

@Repository
public class BanksDAOImpl implements BanksDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<Bank> banksList() {
		return session.selectList("banks.bankList");
	}
	
	@Override
	public List<Bank> selectCardList() {
		return session.selectList("banks.cardList");
	}
	
}
