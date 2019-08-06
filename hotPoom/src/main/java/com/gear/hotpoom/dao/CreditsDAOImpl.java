package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Credit;

@Repository
public class CreditsDAOImpl implements CreditsDAO{
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Credit> selectCardList(int userNo) {
		return session.selectList("credits.selectCardList",userNo);
	}
	
}
