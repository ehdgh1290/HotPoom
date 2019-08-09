package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import com.gear.hotpoom.vo.ChatUser;
import com.gear.hotpoom.vo.CheckRoom;

public interface ChatUsersService {

	public List<ChatUser> getChatRoomList(int no);

	public int invisibleChat(int roomNo, int userNo);

	public int checkRoom(CheckRoom checkRoom);

}
