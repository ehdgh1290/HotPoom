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
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.dao.PhotosDAO;

@Service
public class PoomsServiceImpl implements PoomsService{
	
	@Autowired
	private PoomsDAO poomsDAO;
	@Autowired
	private PhotosDAO photosDAO;
	
	
	//품 등록
	@Override
	public int register(Poom poom, String photoType, String poomImg, String caption) {
		
		System.out.println("photoType : "+photoType);
		System.out.println("poomImg : "+poomImg);
		System.out.println("caption : "+caption);
		
		
		Photo photo = new Photo();
		photo.setNo(poom.getNo());
		photo.setType(photoType);
		photo.setImg(poomImg);
		photo.setCaption(caption);
		
		poomsDAO.insert(poom);
		photosDAO.insert(photo);
		
		return 1;
	}
	
	//품 수정
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
	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PageVO pageVO = new PageVO(page, numPage, speciesNo, petCnt, lowPrice, highPrice, sort, userNo);
		map.put("poomList", poomsDAO.selectPoomList(pageVO));
		int total = poomsDAO.selectPoomListTotal(pageVO);
		map.put("paginate", paginateUtil.getPaginate(page, total, 5, 5, "/poom"));
		return map;
	}
	
}
