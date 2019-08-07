package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.Cert;

public interface CertsDAO {
	
	public int insert(Cert cert);
	public int delete(int userNo);
	public int selectCheckNo(int userNo);

}
