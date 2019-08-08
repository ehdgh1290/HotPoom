package com.gear.hotpoom.controller;

import java.util.List; 
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gear.hotpoom.service.PhotosService;
import com.gear.hotpoom.service.SpeciesService;
import com.gear.hotpoom.vo.Species;

import com.gear.hotpoom.service.BookingsService;
import com.gear.hotpoom.service.LocationsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;

import com.gear.hotpoom.service.AddressesService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.SpeciesService;
import com.gear.hotpoom.vo.Address;
import com.gear.hotpoom.vo.Location;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.Species;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.SpeciesService;

@RestController
@RequestMapping(value="/ajax")
public class AjaxController {
	@Autowired
	private BookingsService bookingsService;
	@Autowired
	private SpeciesService speciesService;
	@Autowired
	private PoomsService poomsService;
	@Autowired
	private AddressesService addressesService;
	@Autowired
	private PhotosService photosService;
	@Autowired
	private LocationsService locationsService;

	
	//booking
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public Map<String,Object> getBookingList(int userNo, int pageNo) {
		return bookingsService.getList(userNo, pageNo);
	}
	
	//Species 자동완성
	@RequestMapping(value="/species/auto/{species}", method=RequestMethod.GET)
	public List<Species> autocompleteSpecies(@PathVariable String species ) {
		
		return speciesService.getList(species);
	}//autocompleteSpecies() end
	
	
	//hot poom list
	@RequestMapping(value="/hot/poom", method=RequestMethod.GET)
	public List<Poom> getHotPoomList() {
		return poomsService.getListHP();
	}//getHotPoomList() end
	
	
	//location 자동완성
	@RequestMapping(value="/location/auto/{location}", method=RequestMethod.GET)
	public List<Location> autocompleteLocation(@PathVariable String location) {
		return locationsService.getList(location);
	}//autocompleteLocation() end
	
	
	@RequestMapping(value="poom/page/{page}", method=RequestMethod.GET)
	public Map<String, Object> getPoomList(@PathVariable int page, int speciesNo, int petCnt, int lowPrice, int highPrice, int sort, HttpSession session){
		User loginUser = (User)session.getAttribute("loginUser");
		int userNo = 0;
		if (loginUser!=null) {
			userNo=loginUser.getNo();
		}
		return poomsService.getPoomList(page, 5, speciesNo, petCnt, lowPrice, highPrice, sort, userNo);
	}
	
	@RequestMapping(value="poom/species/{name}", method=RequestMethod.GET)
	public Map<String, Object> searchSpeciesName(@PathVariable String name){
		System.out.println("controller"+name);
		return speciesService.searchSpeciesName(name);
	}
	
	
	@RequestMapping(value= {"species/{name}","species"}, method=RequestMethod.GET)
	public List<Species> species(@PathVariable(required=false,value="") String name){
		//System.out.println(name);
		return speciesService.getList(name);
	}
	
	//품 메인사진 보이기
	@RequestMapping(value="poom/mainImg/upload",
			method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String uploadPoomMainImg(HttpServletRequest request,MultipartFile poomImg,
			String type, HttpSession session) {
		return photosService.upload(request,poomImg,type,session);
	}
	
	//품 서브사진 보이기
	@RequestMapping(value="poom/subImg/upload",
			method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String uploadPoomSubImg(HttpServletRequest request,MultipartFile poomImg,
			String type, HttpSession session) {
		return photosService.upload(request,poomImg,type,session);
	}
	
	//품 에디터사진 보이기
	@RequestMapping(value="poom/editorImg/upload",
			method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String uploadPoomEditorImg(HttpServletRequest request,MultipartFile poomImg,
			String type, HttpSession session) {
		return photosService.upload(request,poomImg,type,session);
	}
	
}
