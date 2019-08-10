package com.gear.hotpoom.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Poom;

@Repository
public class PoomsDAOImpl implements PoomsDAO{
	@Autowired
	private SqlSession session;
	

	@Override //동호, 품 기본정보 가져오기(사진, 리뷰 제외)
	public Poom selectPoomDetail(int no) {
		return session.selectOne("pooms.selectPoomDetail", no);
	}
	
	@Override
	public Object selectPoomInfo(int no) {
		return session.selectOne("pooms.selectPoomInfo", no);
	}
	
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

	@Override
	public List<Poom> selectList(PageVO pageVO) {
		return session.selectList("pooms.selectMyPoomList",pageVO);
	}// 유저페이지 품리스트 불러오기 .영훈

	
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

	public int insert(Poom poom) {
		return session.insert("pooms.insert",poom);
	}
	
	@Override
	public int update(Poom poom) {
		return session.update("pooms.update",poom);
	}
	
	@Override
	public List<Poom> getPoomCardDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectList("pooms.selectBigCardDetail",no);
	}
	

}
