package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.BankAccount;

public interface BankAccountsDAO {
	
	public BankAccount selectMyAccount(int no);

	public int deleteAccount(int no);

	public int insertAccount(BankAccount bankAccount);

}
