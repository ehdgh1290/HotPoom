package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Address;

@Repository
public class AddressesDAOImpl implements AddressesDAO {

	@Autowired
	private SqlSession session;
	
	
	//si-do
	@Override
	public List<Address> selectListSiDo(String siDo) {
		return session.selectList("address.selectListSiDo", "%"+siDo+"%");
	}//selectListSiDo() end
	
	//si-gun-gu
	@Override
	public List<Address> selectListSiGunGu(String siGunGu) {
		return session.selectList("address.selectListSiGunGu", "%"+siGunGu+"%");
	}//selectListSiGunGu() end
	
	//eup-myeon
	@Override
	public List<Address> selectListEM(String eupMyeon) {
		return session.selectList("address.selectListEM", "%"+eupMyeon+"%");
	}//selectListEM() end
	
	//road name
	@Override
	public List<Address> selectListRoad(String road) {
		return session.selectList("address.selectListRoad", "%"+road+"%");
	}//selectListRoad() end
	
}
