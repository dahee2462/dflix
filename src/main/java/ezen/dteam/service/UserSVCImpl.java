package ezen.dteam.service;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import ezen.dteam.dao.UserDAO;
import ezen.dteam.vo.MemberVO;

@Service
public class UserSVCImpl implements UserSVC{
	
	@Autowired
	UserDAO userDAO;
	
	@Override
	public int checkId(String id) throws Exception{
		return userDAO.checkId(id);
	}
	@Override
	public int checkNickNm(String nickNm) throws Exception {
		return userDAO.checkNickNm(nickNm);
	}	
	@Override
	public int checkEmail(String email) throws Exception {
		return userDAO.checkEmail(email);
	}

	@Override
	public String searchId(MemberVO vo) throws Exception {
		return userDAO.searchId(vo);
	}

	@Override
	public int updatePw(MemberVO vo) throws Exception {
				
System.out.println("updatePw CALL");
		
		//1.임시 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		pw = epwe.encode(pw);
		
		//담을 그릇 vo 생성
		MemberVO newvo = new MemberVO();
		newvo.setMid(vo.getMid());
		newvo.setMpw(pw);
		
		//2. 임시비밀번호 메일 전송
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "dahee930321@gmail.com";
		String hostSMTPpwd = "vlfskqkibvislcnq";
		
		// 보내는 사람 Email, 제목, 내용
		String fromEmail = "dahee930321@gmail.com";
		String fromName = "dflix";

		String subject = "dflix 임시 비밀번호 안내 이메일입니다.";
		String msg = "<div align='center' style='border:1px solid black;'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getMid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += pw + "</p></div>";
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getMemail();
		System.out.println("이메일 보낼 준비를 마쳤습니다");
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(false);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); 
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			System.out.println("send");
			email.send();
			
			//3. 메일전송 성공시 임시 비밀 번호  db update
			userDAO.updatePw(newvo);
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
			return 0;
		}
				 
	}

	
}