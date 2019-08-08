package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;

public interface ChatUsersDAO {

	public int updateInvisible(ChatUser chatUser);

	public int checkRoom(CheckRoom checkRoom);

	public int makeChatUser(CheckRoom checkRoom);

}
