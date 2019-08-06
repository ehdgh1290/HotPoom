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
	public List<Poom> selectPoomList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("pooms.selectPoomList", pageVO);
	}
	
	@Override
	public int selectPoomListTotal(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectOne("pooms.selectPoomListTotal", pageVO);
	}
	
	//hot poom
	@Override
	public List<Poom> selectListHP() {
		return session.selectList("pooms.selectListHP");
	}//selectListHP() end
	
	
	//new poom
	@Override
	public List<Poom> selectListNP() {
		return session.selectList("pooms.selectListNP");
	}//selectListNP() end
	
}
