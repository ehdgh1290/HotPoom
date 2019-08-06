package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.BankAccount;

@Repository
public class BankAccountsDAOImpl implements BankAccountsDAO{
	@Autowired
	private SqlSession session;
	
	
}
