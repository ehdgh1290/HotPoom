package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.vo.Poom;

@Service
public class PoomsServiceImpl implements PoomsService{
	
	@Autowired
	private PoomsDAO poomsDAO;
	private PhotosDAO photosDAO;
	
	@Override
	public int register(Poom poom) {
		
		
		System.out.println(poom.getNo());
		System.out.println(poom.getType());
		System.out.println(poom.getTitle());
		System.out.println(poom.getUserNo());
		System.out.println(poom.getSpeciesNo());
		System.out.println(poom.getPrice());
		System.out.println(poom.getCheckIn());
		System.out.println(poom.getCheckOut());
		System.out.println(poom.getPetCnt());
		System.out.println(poom.getIntroduce());
		System.out.println(poom.getAmenity());
		System.out.println(poom.getMainAddress());
		System.out.println(poom.getSubAddress());
		System.out.println(poom.getPostNum());
		System.out.println(poom.getTransport());
		System.out.println(poom.getLat());
		System.out.println(poom.getLng());

		
		return 1;
	}
	
	@Override
	public int modify(Poom poom) {
		return 0;
	}
	

}
