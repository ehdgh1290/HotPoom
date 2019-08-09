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
import com.gear.hotpoom.service.CreditsService;
import com.gear.hotpoom.service.LocationsService;
import com.gear.hotpoom.service.ReviewsService;
import com.gear.hotpoom.service.BookingsService;
import com.gear.hotpoom.service.BookmarksService;
import com.gear.hotpoom.service.CreditsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;
import com.gear.hotpoom.service.AddressesService;
import com.gear.hotpoom.service.BankAccountsService;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.ReportsService;
import com.gear.hotpoom.service.SpeciesService;
import com.gear.hotpoom.vo.Address;
import com.gear.hotpoom.vo.BankAccount;
import com.gear.hotpoom.vo.Credit;
import com.gear.hotpoom.vo.Location;
import com.gear.hotpoom.vo.Bookmark;
import com.gear.hotpoom.vo.Credit;
import com.gear.hotpoom.vo.Poom;
import com.gear.hotpoom.vo.Species;
import com.gear.hotpoom.service.PoomsService;
import com.gear.hotpoom.service.SpeciesService;

import com.gear.hotpoom.service.ChatUsersService;
import com.gear.hotpoom.service.MessagesService;
import com.gear.hotpoom.vo.Message;

@RestController

@RequestMapping("/ajax")
public class AjaxController {
	@Autowired
	private ReviewsService reviewsService;
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
	@Autowired
	private UsersService usersService;
	@Autowired
	private CreditsService creditsService;
	@Autowired
	private BankAccountsService bankAccountsService;
	@Autowired
	private BookmarksService bookmarksService;
	@Autowired
	private ReportsService reportsService;
	@Autowired
	private ChatUsersService chatUsersService;
	@Autowired
	private MessagesService messagesService;
	
	

	
	//신고한 적이 있는지 확인
	@RequestMapping(value="/report",method=RequestMethod.GET)
	public int isReport(int reviewNo) {
		return reportsService.isReport(reviewNo);
	}
	
	//북마크
	@RequestMapping(value="/bookmark",method=RequestMethod.POST)
	public boolean bookmark(Bookmark bookmark) {
		return bookmarksService.register(bookmark);
	}
	


	
	//poomDetail에서 리뷰 가져오기
	@RequestMapping(value="/review",method=RequestMethod.GET)
	public Map<String, Object> getReviews(int no, int pageNo) {
		
		return reviewsService.getReviewList(no, pageNo);
	}
	
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
	
	
	

	
	
	
	
	
	// 주하꺼임
	
	@RequestMapping(value="/myCardList/{userNo}", method=RequestMethod.GET)
	public List<Credit> getMyCardList(@PathVariable int userNo) {
		
		return creditsService.getMyCardList(userNo);
	}
	
	@RequestMapping(value="/addCard", method=RequestMethod.POST)
	public int addCard(Credit credit) {
		return creditsService.addCard(credit);
	}
	
	@RequestMapping(value="/removeCard/{cardNo}", method=RequestMethod.DELETE)
	public int removeCard(@PathVariable int cardNo) {
		return creditsService.removeCard(cardNo);
	}
	
	@RequestMapping(value="/setDefault/{userNo}/{no}", method=RequestMethod.PUT)
	public int setDefault(@PathVariable int userNo,@PathVariable int no) {
		System.out.println(userNo);
		System.out.println(no);
		return creditsService.setDefault(userNo, no);
	}
	
	@RequestMapping(value="/updateName/{userNo}/{name}", method=RequestMethod.PUT)
	public int updateName(User user, @PathVariable String name, @PathVariable int userNo) {

		user.setNo(userNo);
		user.setName(name);
		// System.out.println(user.getName());
		
		return usersService.modifyName(user);
	}
	
	@RequestMapping(value="/updatePhoneNum/{userNo}/{phoneNum}", method=RequestMethod.PUT)
	public int updatePhoneNum(User user, @PathVariable String phoneNum, @PathVariable int userNo) {

		user.setNo(userNo);
		user.setPhoneNum(phoneNum);
		System.out.println(user.getPhoneNum());
		
		return usersService.modifyPhoneNum(user);
	}

	@RequestMapping(value="/addAccount", method=RequestMethod.POST)
	public int addAccount(BankAccount bankAccount) {
		
		return bankAccountsService.addAccount(bankAccount);
	}
	
	@RequestMapping(value="/myAccount/{userNo}", method=RequestMethod.GET)
	public BankAccount getMyAccount(@PathVariable int userNo) {
		
		return bankAccountsService.getMyAccount(userNo);
	}
	
	
	@RequestMapping(value="/email/{email}", method=RequestMethod.GET)
	public String checkEmail(@PathVariable String email, String check) {
		
		boolean result = usersService.checkEmail(check);
		
				// System.out.println(check);
				// System.out.println(email);
				// System.out.println(result);
		
		return "{\"result\":"+result+"}";
	}//checkEmail() end
	

	
	
	// 삭제처리
	@RequestMapping(value="/invisible", method=RequestMethod.GET)
	public int invisibleChat(int roomNo, int userNo) {
		chatUsersService.invisibleChat(roomNo, userNo);
		return 1;
	}
	
	// 메시지불러오기
	@RequestMapping(value = "/message")
	public List<Message> getMessageList(int roomNo, int userNo) {
		Message message = new Message(roomNo, userNo);
		
		return messagesService.getMessageList(message);
	}
	
	
	
	
	@RequestMapping(value="/compare/{userNo}", method=RequestMethod.GET)
	public Map<String, Object> bookmarkList(@PathVariable int userNo) {
		
	
		return poomsService.getCompareCardDetail(userNo);
	}
	

	
}
