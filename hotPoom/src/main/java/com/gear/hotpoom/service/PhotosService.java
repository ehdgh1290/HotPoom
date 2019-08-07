package com.gear.hotpoom.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.gear.hotpoom.vo.Photo;


public interface PhotosService {
	
	public String upload(HttpServletRequest request,
						MultipartFile poomImg, String type,HttpSession session);
	
	public int modify(Photo photo);

	
}
