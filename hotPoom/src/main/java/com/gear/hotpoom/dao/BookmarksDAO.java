package com.gear.hotpoom.dao;

import com.gear.hotpoom.vo.Bookmark;

public interface BookmarksDAO {
	
	public int insert(Bookmark bookmark);
	public int delete(Bookmark bookmark);
}
