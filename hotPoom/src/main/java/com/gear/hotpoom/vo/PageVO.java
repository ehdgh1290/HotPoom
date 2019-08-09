package com.gear.hotpoom.vo;

public class PageVO {
	private int start, end;	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}//기본생성자
	
	private int userNo;
	
	
	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public PageVO(int pageNo, int numPage) {
		end = pageNo*numPage;
		start = end-(numPage-1);
	}
	
	

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	
	
	
	
	
}
