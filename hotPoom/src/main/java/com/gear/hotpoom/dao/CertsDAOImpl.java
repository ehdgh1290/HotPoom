package com.gear.hotpoom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Cert;

@Repository
public class CertsDAOImpl implements CertsDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Cert cert) {
		return session.insert("certs.insert",cert);
	}
	
	@Override
	public int delete(int userNo) {
		return session.delete("certs.delete",userNo);
	}
	
	@Override
	public int selectCheckNo(int userNo) {
		return session.selectOne("certs.selectCheckNo",userNo);

	}
	
	
}
