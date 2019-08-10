package com.gear.hotpoom.vo;

public class PageVO {
	
	private int start, end, speciesNo, petCnt, lowPrice, highPrice, sort, no, userNo;
	private String mainAddress;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PageVO(int page, int numPage) {
		//page : 페이지번호
		//numPage : 한페이지당 보여지는 게시물수
		this.end = page * numPage;
		this.start = end-numPage+1;
	}
	public PageVO(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, int userNo, String mainAddress) {
		//page : 페이지번호
		//numPage : 한페이지당 보여지는 게시물수
		this.end = page * numPage;
		this.start = end-numPage+1;
		if(speciesNo>0) {
			this.speciesNo=speciesNo;
		}
		if(petCnt>0) {
			this.petCnt=petCnt;
		}
		if(lowPrice>0) {
			this.lowPrice=lowPrice;
		}
		if(highPrice>0) {
			this.highPrice=highPrice;
		}
		if(userNo>10) {
			this.userNo=userNo;
		}
		this.sort=sort;
		if(mainAddress!=null) {
			this.mainAddress=mainAddress;
		}
	}
	
	public PageVO(int page, int numPage, int no) {
		this.end = page * numPage;
		this.start = end-numPage+1;
		this.no = no;
	}
	
	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}
	public int getHighPrice() {
		return highPrice;
	}
	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}
	public int getPetCnt() {
		return petCnt;
	}
	public void setPetCnt(int petCnt) {
		this.petCnt = petCnt;
	}
	public int getSpeciesNo() {
		return speciesNo;
	}
	public void setSpeciesNo(int speciesNo) {
		this.speciesNo = speciesNo;
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