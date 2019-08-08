package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;

public interface ChatRoomsDAO {

	public List<ChatUser> selectChatRoom(int no);

	public int makeRoom(CheckRoom checkRoom);

}
