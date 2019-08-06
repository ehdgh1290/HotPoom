package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.AddressesDAO;
import com.gear.hotpoom.vo.Address;

@Service
public class AddressesServiceImpl implements AddressesService {

	@Autowired
	private AddressesDAO addressesDAO;
	
	//위치 자동완성
	@Override
	public List<Address> getList(String location) {
		
		List<Address> list = addressesDAO.selectListSiDo(location);
		
		if (list.size() < 5) {
			
			List<Address> gungu = addressesDAO.selectListSiGunGu(location);
			
			list.addAll(gungu);
			
			System.out.println(list);
			
			
			if (list.size() < 5) {
				
				List<Address> eupMyeon = addressesDAO.selectListEM(location);
				
				list.addAll(eupMyeon);
				
				System.out.println(list+"2");
				
				
				if (list.size() < 5) {
				
					List<Address> road = addressesDAO.selectListRoad(location);
					
					list.addAll(road);
					
					System.out.println(list+"3");
				}//road if end
			}//eupMyeon if end
		}//gungu if end
		
		return list;
	}//getList() end
}
