package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.PageVO;

import com.gear.hotpoom.dao.PhotosDAO;

@Service
public class PoomsServiceImpl implements PoomsService{
	
	@Autowired
	private PoomsDAO poomsDAO;
	@Autowired
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
	
	//hot poom
	@Override
	public List<Poom> getListHP() {
		return poomsDAO.selectListHP();
	}//getList() end
	
	//new poom
	@Override
	public List<Poom> getListNP() {
		return poomsDAO.selectListNP();
	}//getListNP() end
	
	
	
	@Autowired
	private PaginateUtil paginateUtil;
	
	@Override
	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PageVO pageVO = new PageVO(page, numPage, speciesNo, petCnt, lowPrice, highPrice, sort);
		map.put("poomList", poomsDAO.selectPoomList(pageVO));
		int total = poomsDAO.selectPoomListTotal(pageVO);
		map.put("paginate", paginateUtil.getPaginate(page, total, 5, 5, "/poom"));
		return map;
	}
	
}
