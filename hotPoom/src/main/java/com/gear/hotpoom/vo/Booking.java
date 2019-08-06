package com.gear.hotpoom.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
	private int userNo, poomNo, petCnt, price, hostNo;
	private String no, request, userState, hostState, img, mainAddress, subAddress, speciesName, poomType, poomTitle;
	private Date startDay, endDay;
	private Timestamp regdate;
	private boolean isReview;
	
	public Booking() {
		// TODO Auto-generated constructor stub
	}

	public String getPoomTitle() {
		return poomTitle;
	}

	public void setPoomTitle(String poomTitle) {
		this.poomTitle = poomTitle;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public String getSubAddress() {
		return subAddress;
	}

	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}

	public String getSpeciesName() {
		return speciesName;
	}

	public void setSpeciesName(String speciesName) {
		this.speciesName = speciesName;
	}

	public String getPoomType() {
		return poomType;
	}

	public void setPoomType(String poomType) {
		this.poomType = poomType;
	}

	public boolean getIsReview() {
		return isReview;
	}

	public void setIsReview(boolean isReview) {
		this.isReview = isReview;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPoomNo() {
		return poomNo;
	}

	public void setPoomNo(int poomNo) {
		this.poomNo = poomNo;
	}

	public int getPetCnt() {
		return petCnt;
	}

	public void setPetCnt(int petCnt) {
		this.petCnt = petCnt;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public String getHostState() {
		return hostState;
	}

	public void setHostState(String hostState) {
		this.hostState = hostState;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getEndDay() {
		return endDay;
	}

	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
