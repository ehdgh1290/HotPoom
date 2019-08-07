package com.gear.hotpoom.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gear.hotpoom.dao.CertsDAO;
import com.gear.hotpoom.dao.UsersDAO;
import com.gear.hotpoom.vo.Cert;
import com.gear.hotpoom.vo.User;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDAO usersDAO;
	@Autowired
	private CertsDAO certsDAO;
	
	@Override
	public int getUserNo(String email) {
		
		int count = usersDAO.selectCheckId(email);
		
		if(count==0) {
			return 0;
		}else {
				
			int userNo = usersDAO.selectNoByEmail(email);

			UUID uuid = UUID.randomUUID();
			System.out.println("UUID : "+uuid.toString());
			
			String code = uuid.toString();
	
			//User user2 = usersDAO.selectUserInfo(user);
	
			//System.out.println(user2.getNo());
			
			Cert cert = new Cert();
			
			cert.setUserNo(userNo);
			cert.setCode(code);
			cert.setType("E");
					
			int result = certsDAO.insert(cert);
			System.out.println(result);
			
			String ip = null;
			try {
				ip = InetAddress.getLocalHost().getHostAddress();
			} catch (UnknownHostException e1) {
				e1.printStackTrace();
			}
	
			// 네이버일 경우 smtp.naver.com 을 입력합니다. 
			// Google일 경우 smtp.gmail.com 을 입력합니다. 
			String host = "smtp.naver.com"; 
			final String username = "jbpspoon"; //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요. 
			final String userpassword = "woalzlehd!"; //네이버 이메일 비밀번호를 입력해주세요. 
			
			int port=465; //포트번호 // 메일 내용 
			String recipient = "clsrnctnwjd@naver.com"; //받는 사람의 메일주소를 입력해주세요. 
			//String recipient = id; //받는 사람의 메일주소를 입력해주세요. 
			String subject = "HotPoom"; //메일 제목 입력해주세요. 
			String body = "<h2>HotPoom 비밀번호 변경</h2>"
					+ "<br/><h3> 아래의 링크를 클릭하여 비밀번호 변경 페이지로 이동하세요.</h3>"
					+"<br/><a href=\"http://"+ip+"/user/"+userNo+"/password/update\">비밀번호 변경 페이지로 가기</a>"; //메일 내용 입력해주세요. 
			
			Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정 
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true"); 
			props.put("mail.smtp.ssl.trust", host); //Session 생성 
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un=username; 
				String pw=userpassword;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw); 
					}
				}); 
			session.setDebug(true); //for debug 
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
			try {
				mimeMessage.setFrom(new InternetAddress("jbpspoon@naver.com"));
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
				mimeMessage.setSubject(subject); //제목셋팅 
				//mimeMessage.setText(body); //내용셋팅
				mimeMessage.setContent(body,"text/html; charset=UTF-8"); //내용셋팅 (마크업을 사용하기위해 setText가 아니라 setContent사용) 
				Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
				//System.out.println("test");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
						
			//세션을 생성한다
			//HttpSession popupSession = req.getSession();
			
			//popupSession.setAttribute("sendId", user.getId());
		
			return 1;
			
		}
		
	}
	
	@Override
	public int updatePassword(User user, int no) {
		usersDAO.updatePassword(user);
		certsDAO.delete(no);
		return 1;
	}

}
