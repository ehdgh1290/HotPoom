package com.gear.hotpoom.controller;



import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PathVariable;
import com.gear.hotpoom.service.CertsService;
import com.gear.hotpoom.service.PetsService;
import com.gear.hotpoom.service.BankAccountsService;
import com.gear.hotpoom.service.UsersService;
import com.gear.hotpoom.vo.User;
import com.gear.hotpoom.vo.Pet;




@Controller
public class UserController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private CertsService certsService;
	@Autowired
	private PetsService petsService;
	@Autowired
	private BankAccountsService bankAccountsService;

	
	//로그인
	@RequestMapping(value="/session",method=RequestMethod.POST)
	public String login(User user,HttpSession session, @RequestHeader String referer, RedirectAttributes ra) {
		User loginUser = usersService.loginCheck(user);
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}else {
			ra.addFlashAttribute("loginFail", true);
		}
		return "redirect:"+referer;
	}
	
	//로그아웃
	@RequestMapping(value="/session",method=RequestMethod.DELETE)
	public String logout(HttpSession session, @RequestHeader String referer) {
		session.removeAttribute("loginUser");
		return "redirect:"+referer;
	}
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/user/password/find",method=RequestMethod.GET)
	public String passwordFindForm() {
		return "passwordFindForm";
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/ajax/send/email",method=RequestMethod.POST)
	@ResponseBody
	public int emailSend(String email) {
		return usersService.getUserNo(email);
	}
	
	//비밀번호 재설정 페이지로 이동
	@RequestMapping(value="/user/{no}/password/update",method=RequestMethod.GET)
	public String passwordResetForm(@PathVariable int no) {		
		return "passwordUpdateForm";
	}
	
	//비밀번호 재설정
	@RequestMapping(value="/user/password/update", method=RequestMethod.POST)
	public String passwordReset(User user, int no) {
		usersService.updatePassword(user,no);
		return "index";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String signUpForm() {
		
		return "signUpForm";
	}//signUpForm() end
	
	// 회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String sign(User user, @RequestHeader String referer, int year, int month, int date) {
				
		String birthDateStr = year+"-"+month+"-"+date;
		
		Date birthDate = Date.valueOf(birthDateStr);
		
		user.setBirthDate(birthDate);
		
		user.setProfileImg("defaultProfile.jpg");
		user.setIntroduce("안녕하세요.");

		usersService.sign(user);
		
		return "redirect:/index";
	}//sign() end
	
	
	
	
	
	// 계정 관리
	@RequestMapping(value="/account/{userNo}", method=RequestMethod.GET)
	public String account(Model model, @PathVariable int userNo) {
		
		model.addAllAttributes(usersService.getAccountDetail(userNo));
		
		return "account";
	}//account() end
	
	// 계좌 삭제
	@RequestMapping(value="/user/account/{no}/{userNo}", method=RequestMethod.DELETE)
	public String deleteAccount(@PathVariable int no, @PathVariable int userNo) {
		
		bankAccountsService.remove(no);
		
		return "redirect:/account/{userNo}";
	}//deleteAccount() end



	@RequestMapping(value="/user/{userNo}",method=RequestMethod.GET)
	public String userPage(@PathVariable int userNo, Model model) {
			
		model.addAllAttributes(usersService.getUserInfo(userNo));
		
		return "userPage";
	} //유저페이지 기본 정보 불러오기 .영훈
	

	


}


	
	
	





