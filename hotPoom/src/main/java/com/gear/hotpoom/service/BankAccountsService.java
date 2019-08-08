package com.gear.hotpoom.service;

import java.util.List;

import com.gear.hotpoom.vo.BankAccount;
import com.gear.hotpoom.vo.Credit;

public interface BankAccountsService {

	public int remove(int no);

	public int addAccount(BankAccount bankAccount);

	public BankAccount getMyAccount(int userNo);

}
