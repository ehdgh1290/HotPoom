package com.gear.hotpoom.vo;

import java.sql.Timestamp;
import java.util.List;

public class Photo {
	private int no, contentNo;
	private String type, img, caption;
	private List<Photo> subPhotos;
	private Timestamp regdate;
	
	public Photo() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Photo> getSubPhotos() {
		return subPhotos;
	}

	public void setSubPhotos(List<Photo> subPhotos) {
		this.subPhotos = subPhotos;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
