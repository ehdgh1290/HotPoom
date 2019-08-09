package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Poom;

@Service
public class PoomsServiceImpl implements PoomsService{

	@Autowired
	private PoomsDAO poomsDAO;
	
	@Override
	public List<Poom> getPoomList(int userNo, int pageNo) {
		PageVO pageVO = new PageVO(pageNo,9);
		pageVO.setUserNo(userNo);
		
		return poomsDAO.selectList(pageVO);
	}//유저페이지 품리스트 불러오기 .영훈
}
