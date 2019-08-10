package com.gear.hotpoom.dao;

import java.util.List;

import com.gear.hotpoom.vo.Bookmark;

public interface BookmarksDAO {
	
	public int insert(Bookmark bookmark);
	public int delete(Bookmark bookmark);
	
	
	public List<Bookmark> getPoomNo(int userNo);
	public int selectPoomBookmark(Bookmark bookmark);
}
