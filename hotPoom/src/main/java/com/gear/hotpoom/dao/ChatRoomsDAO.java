package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.ChatRoom;
import java.util.List;
import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;


public interface ChatRoomsDAO {

	public int addChatRoom(ChatRoom chatRoom);
	
	public List<ChatUser> selectChatRoom(int no);

	public int makeRoom(CheckRoom checkRoom);

}
