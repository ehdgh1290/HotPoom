package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.gear.hotpoom.dao.PetsDAO;
import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.vo.Pet;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
=======
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.PageVO;
>>>>>>> origin/feature/Detail

@Service
public class PoomsServiceImpl implements PoomsService{
	@Autowired
	private PoomsDAO poomsDAO;
	@Autowired
	private PhotosDAO photosDAO;
	@Autowired
	private PetsDAO petsDAO;
	

<<<<<<< HEAD
	@Override
	public Map<String, Object> getDetail(int no) {
		
		System.out.println("PoomsService getDetail() no : "+no);
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		Poom poom = poomsDAO.selectPoomDetail(no);
		System.out.println(poom);
		List<Photo> photos = photosDAO.selectPoomPhotos(no);
		System.out.println(photos);
		List<Pet> pets = petsDAO.selectPetListByUserNo(poom.getUserNo());
		System.out.println(pets);
		map.put("poom", poom);
		map.put("photoList", photos);
		map.put("petList", pets);
		
		return map;
	}
}
=======
	@Autowired
	private PoomsDAO poomsDAO;
	
	
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
>>>>>>> origin/feature/Detail
