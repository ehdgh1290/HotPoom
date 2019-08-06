package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Message;

public interface MessagesDAO {

	public Message selectTitle(int no);

	public List<Message> getMessageList(Message message);

}
