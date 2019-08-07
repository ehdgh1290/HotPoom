package com.gear.hotpoom.service;

import com.gear.hotpoom.vo.Cert;

public interface CertsService {
	
	public int register(Cert cert);
	public int remove(int userNo);

}
