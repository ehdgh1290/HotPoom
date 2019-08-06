package com.gear.hotpoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.MessagesDAO;
import com.gear.hotpoom.vo.Message;

@Service
public class MessagesServiceImpl implements MessagesService{

	@Autowired
	private MessagesDAO messagesDAO;
	
	@Override
	public List<Message> getMessageList(Message message) {
		return messagesDAO.getMessageList(message);
	}
	
}
