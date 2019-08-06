package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BankAccountsDAO;
import com.gear.hotpoom.vo.BankAccount;

@Service
public class BankAccountsServiceImpl implements BankAccountsService{
	@Autowired
	private BankAccountsDAO bankAccountsDAO;
	
	
}
