package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BankAccountsDAO;
import com.gear.hotpoom.vo.BankAccount;

@Service
public class BankAccountsServiceImpl implements BankAccountsService{
	@Autowired
	private BankAccountsDAO bankAccountsDAO;
	
	@Override
	public int remove(int no) {
		// TODO Auto-generated method stub
		return bankAccountsDAO.deleteAccount(no);
	}
	
	@Override
	public int addAccount(BankAccount bankAccount) {
		// TODO Auto-generated method stub
		return bankAccountsDAO.insertAccount(bankAccount);
	}
	
	@Override
	public BankAccount getMyAccount(int userNo) {
		// TODO Auto-generated method stub
		return bankAccountsDAO.selectMyAccount(userNo);
	}

	
}
