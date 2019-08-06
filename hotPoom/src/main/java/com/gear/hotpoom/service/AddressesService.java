package com.gear.hotpoom.service;

import java.util.List;

import com.gear.hotpoom.vo.Address;

public interface AddressesService {
	
	public List<Address> getList(String location);

}
