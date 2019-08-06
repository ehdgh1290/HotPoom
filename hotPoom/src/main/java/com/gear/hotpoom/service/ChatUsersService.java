package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.ChatUser;

public interface ChatUsersService {

	public List<ChatUser> getChatRoomList(int no);

	public int invisibleChat(int roomNo, int userNo);

}
