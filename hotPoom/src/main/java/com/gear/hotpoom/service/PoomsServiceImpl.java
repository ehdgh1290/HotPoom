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
	private PaginateUtil paginateUtil;
	@Autowired
	private PoomsDAO poomsDAO;
	
	
	//품 하나 가져오기
	@Override
	public Object getPoomInfo(int no) {
		return poomsDAO.selectPoomInfo(no);
	}
	
	//품 등록
	@Override
	public int register(Poom poom) {
		return poomsDAO.insert(poom);
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

	
	@Override
	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PageVO pageVO = new PageVO(page, numPage, speciesNo, petCnt, lowPrice, highPrice, sort);
		map.put("poomList", poomsDAO.selectPoomList(pageVO));
		int total = poomsDAO.selectPoomListTotal(pageVO);
		map.put("paginate", paginateUtil.getPaginate(page, total, 5, 5, "/poom"));
		return map;
	}
	
}
