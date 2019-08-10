package com.gear.hotpoom.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gear.hotpoom.vo.Bookmark;

@Repository
public class BookmarksDAOImpl implements BookmarksDAO{
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int selectPoomBookmark(Bookmark bookmark) {
		return session.selectOne("bookmarks.selectPoomBookmark", bookmark);
	}
	
	@Override
	public int delete(Bookmark bookmark) {
		return session.delete("bookmarks.delete",bookmark);
	}
	
	@Override
	public int insert(Bookmark bookmark) {
		return session.insert("bookmarks.insert", bookmark);
	}
	
	@Override
	public List<Bookmark> getPoomNo(int userNo) {
		return session.selectList("bookmarks.poomNoListByBookmark",userNo);
	}
	
}
