package com.gear.hotpoom.vo;

public class CheckRoom {

	private int no, userNo, roomNo;
	
	public CheckRoom() {
		// TODO Auto-generated constructor stub
	}
	
	public CheckRoom(int no, int userNo) {
		this.no = no;
		this.userNo = userNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	
	
	
}
