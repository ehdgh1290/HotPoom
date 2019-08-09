package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Poom;

@Repository
public class PoomsDAOImpl implements PoomsDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Poom> selectList(PageVO pageVO) {
		return session.selectList("pooms.selectPoomList",pageVO);
	}// 유저페이지 품리스트 불러오기 .영훈
	
	
}
