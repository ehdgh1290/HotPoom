package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.User;

public interface ChatUsersDAO {

	int insertAdminChatUser(int roomNo);

	int insert(User user);
}
