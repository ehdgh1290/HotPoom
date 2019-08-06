package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Address;

public interface AddressesDAO {
	
	//si-do
	public List<Address> selectListSiDo(String siDo);
	//si-gun-gu
	public List<Address> selectListSiGunGu(String siGunGu);
	//eup-myeon
	public List<Address> selectListEM(String eupMyeon);
	//road name
	public List<Address> selectListRoad(String road);

}
