package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.CertsDAO;
import com.gear.hotpoom.vo.Cert;

@Service
public class CertsServiceImpl implements CertsService{
	
	@Autowired
	private CertsDAO certsDAO;
	
	@Override
	public int register(Cert cert) {
		return certsDAO.insert(cert);
	}
	
	@Override
	public int remove(int userNo) {
		return certsDAO.delete(userNo);
	}

}
