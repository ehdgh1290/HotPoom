package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gear.hotpoom.dao.BookmarksDAO;
import com.gear.hotpoom.vo.Bookmark;

@Service
public class BookmarksServiceImpl implements BookmarksService{
	@Autowired
	private BookmarksDAO bookmarksDAO;
	
	@Override
	@Transactional
	public boolean register(Bookmark bookmark) {
		int isBookmark = bookmarksDAO.delete(bookmark);
		if(isBookmark==0) {
			bookmarksDAO.insert(bookmark);
		}
		return isBookmark==0;
	}
}
