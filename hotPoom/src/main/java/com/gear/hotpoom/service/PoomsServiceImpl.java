package com.gear.hotpoom.service;

import java.util.List;
import java.util.Map;

import java.util.concurrent.ConcurrentHashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gear.hotpoom.dao.BanksDAO;
import com.gear.hotpoom.dao.BookmarksDAO;
import com.gear.hotpoom.dao.PetsDAO;
import com.gear.hotpoom.dao.PhotosDAO;
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.dao.ReviewsDAO;
import com.gear.hotpoom.dao.UsersDAO;
import com.gear.hotpoom.vo.Pet;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.dao.PoomsDAO;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.util.PaginateUtil;
import com.gear.hotpoom.vo.Bookmark;
import com.gear.hotpoom.vo.PageVO;
import com.gear.hotpoom.vo.Photo;
import com.gear.hotpoom.dao.PhotosDAO;


@Service
public class PoomsServiceImpl implements PoomsService{
	@Autowired
	private PoomsDAO poomsDAO;
	@Autowired
	private PhotosDAO photosDAO;
	@Autowired
	private PetsDAO petsDAO;
	@Autowired
	private BanksDAO banksDAO;
	@Autowired
	private PaginateUtil paginateUtil;

	@Autowired
	private BookmarksDAO bookmarksDAO;

	@Autowired
	private UsersDAO usersDAO;
	

	

	@Override //동호, poomDetail 정보 가져오기
	public Map<String, Object> getDetail(int no) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		Poom poom = poomsDAO.selectPoomDetail(no);
		List<Photo> photos = photosDAO.selectPoomPhotos(no);
		List<Pet> pets = petsDAO.selectPetListByUserNo(poom.getUserNo());
		
		map.put("poom", poom);
		map.put("photoList", photos);
		map.put("petList", pets);
		map.put("cardList", banksDAO.selectCardList());
		
		return map;
	}
	
	//품 등록
	@Override
	public int register(Poom poom, String photoType, String poomImg, String caption) {
		
		System.out.println("photoType : "+photoType);
		System.out.println("poomImg : "+poomImg);
		System.out.println("caption : "+caption);
		
		
		Photo photo = new Photo();
		photo.setNo(poom.getNo());
		photo.setType(photoType);
		photo.setImg(poomImg);
		photo.setCaption(caption);
		
		poomsDAO.insert(poom);
		photosDAO.insert(photo);
		
		return 1;
	}
	
	//품 수정
	@Override
	public int modify(Poom poom) {
		return 0;
	}
	
	//hot poom
	@Override
	public List<Poom> getListHP() {
		return poomsDAO.selectListHP();
	}//getList() end
	
	
	//new poom
	@Override
	public List<Poom> getListNP() {
		return poomsDAO.selectListNP();
	}//getListNP() end


	
	@Override
	public Map<String, Object> getPoomList(int page, int numPage, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PageVO pageVO = new PageVO(page, numPage, speciesNo, petCnt, lowPrice, highPrice, sort, userNo);
		map.put("poomList", poomsDAO.selectPoomList(pageVO));
		int total = poomsDAO.selectPoomListTotal(pageVO);
		map.put("paginate", paginateUtil.getPaginate(page, total, 5, 5, "/poom"));
		return map;
	}
	
	
	@Override
	public List<Poom> getPoomList(int userNo, int pageNo) {
		PageVO pageVO = new PageVO(pageNo,9);
		pageVO.setUserNo(userNo);
		
		return poomsDAO.selectList(pageVO);
	}//유저페이지 품리스트 불러오기 .영훈


	
	@Override
	public Map<String, Object> getCompareCardDetail(int userNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		map.put("user", usersDAO.getOneUser(userNo));
		
		List<Bookmark> poomNoList = bookmarksDAO.getPoomNo(userNo);
		List<Poom> poomList = poomsDAO.getPoomCardDetail(userNo);


		for(Poom poom : poomList) {

			List<Photo> photoList = photosDAO.getPoomCardPhoto(poom.getNo());

			poom.setPhotoList(photoList);
			
		
		}
		
		map.put("pooms",poomList);

		return map;
	
	}

}
