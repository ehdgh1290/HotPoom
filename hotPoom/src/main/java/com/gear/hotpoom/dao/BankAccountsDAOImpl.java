package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.BankAccount;

@Repository
public class BankAccountsDAOImpl implements BankAccountsDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public BankAccount selectMyAccount(int no) {
		return session.selectOne("bank-accounts.selectMyAccount", no);
	}
	
	@Override
	public int deleteAccount(int no) {
		// TODO Auto-generated method stub
		return session.delete("bank-accounts.deleteAccount",no);
	}
	
	@Override
	public int insertAccount(BankAccount bankAccount) {
		// TODO Auto-generated method stub
		return session.insert("bank-accounts.insertAccount",bankAccount);
	}
	
}
