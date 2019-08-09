package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;
import com.gear.hotpoom.vo.User;

public interface ChatUsersDAO {

	public int insertAdminChatUser(int roomNo);

	public int insert(User user);

	public int updateInvisible(ChatUser chatUser);

	public int checkRoom(CheckRoom checkRoom);

	public int makeChatUser(CheckRoom checkRoom);

}
