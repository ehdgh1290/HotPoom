package com.gear.hotpoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.BookmarksDAO;
import com.gear.hotpoom.vo.Bookmark;

@Service
public class BookmarksServiceImpl implements BookmarksService{
	@Autowired
	private BookmarksDAO bookmarksDAO;
	
	@Override //북마크 추가 or 해제
	public boolean register(Bookmark bookmark) {
		int isBookmark = bookmarksDAO.delete(bookmark);
		//지워진게 없으면 북마크 추가
		if(isBookmark==0) {
			bookmarksDAO.insert(bookmark);
		}
		return isBookmark==0;
	}
}
