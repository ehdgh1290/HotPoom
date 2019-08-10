package com.gear.hotpoom.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.gear.hotpoom.vo.Photo;


public interface PhotosService {
	
	public String upload(HttpServletRequest request,
						MultipartFile poomImg, String type,HttpSession session);
	
	public int modify(Photo photo);

	public int register(Photo photo);

	public Photo getMainPhoto(int no);

	public List<Photo> getSubPhotoList(int no);

	
}
