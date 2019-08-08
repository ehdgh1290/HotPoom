package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BanksDAO;
import com.gear.hotpoom.dao.PetsDAO;
import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.vo.Pet;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.PageVO;

@Service
public class PoomsServiceImpl implements PoomsService{
	@Autowired
	private PoomsDAO poomsDAO;
	@Autowired
	private PhotosDAO photosDAO;
	@Autowired
	private PetsDAO petsDAO;
	@Autowired
	private BanksDAO banksDAO;
	@Autowired
	private PaginateUtil paginateUtil;
	

	@Override //동호, poomDetail 정보 가져오기
	public Map<String, Object> getDetail(int no) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		Poom poom = poomsDAO.selectPoomDetail(no);
		List<Photo> photos = photosDAO.selectPoomPhotos(no);
		List<Pet> pets = petsDAO.selectPetListByUserNo(poom.getUserNo());
		
		map.put("poom", poom);
		map.put("photoList", photos);
		map.put("petList", pets);
		map.put("cardList", banksDAO.selectCardList());
		
		return map;
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
