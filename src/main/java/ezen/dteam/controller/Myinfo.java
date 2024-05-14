package ezen.dteam.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.dteam.service.MyinfoSVCImpl;
import ezen.dteam.vo.MemberVO;
import ezen.dteam.vo.TicketDetailVO;
import ezen.dteam.vo.TicketVO;
import ezen.dteam.vo.UserVO;

@Controller
public class Myinfo {

	@Autowired
	MyinfoSVCImpl service;

	// 나의 예매내역 조회
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String myinfo(Authentication auth, Model model) throws Exception {
		// 로그인한 유저 가져오기
		UserVO loginVO = (UserVO) auth.getPrincipal();
		MemberVO user = service.selectMyinfo(loginVO.getMid());
		ArrayList<Map<String, Object>> allList = new ArrayList<Map<String, Object>>();

		// 티켓별 내용을 가져온다
		List<TicketVO> myTicketList = service.selectMyticket(Integer.toString(user.getMno()));
		for (TicketVO item : myTicketList) {
			Map<String, Object> map = new HashMap<String, Object>();
			item.getTicketno();
			// 각 티켓 번호로 티켓 세부내용을 DB에서 받아온다
			List<TicketDetailVO> ticketdetail = service.selectTicketDetail(Integer.toString(item.getTicketno()));
			/*
			 * for(TicketDetailVO dVo : ticketdetail ) { System.out.println(dVo.toString());
			 * }
			 */
			map.put("ticket", item);
			map.put("detail", ticketdetail);
			allList.add(map);
		}
//		List<TicketDetailVO> ticketdetail = service.selectTicketDetail();

//		for (Map<String, Object> tVo : allList) {
//			TicketVO ticket = (TicketVO) tVo.get("ticket");
//			List<TicketDetailVO> tdList = (List<TicketDetailVO>) tVo.get("detail");
//
//			System.out.println("티겟 번호 : " + ticket.getTicketno());
//			System.out.println("인원수 : " + tdList.size());
//			for (TicketDetailVO dVo : tdList) {
//				System.out.println("좌석번호 : " + dVo.getSseatno());
//				System.out.println("영화이름 : " + dVo.getCname());
//			}
//
//		}
//		model.addAttribute("myTicketList", myTicketList);
//		model.addAttribute("ticketdetail", ticketdetail);
		model.addAttribute("list", allList);

		return "myInfo/myTicketing";
	}

	// 예매취소
	@RequestMapping(value = "/myTicketDel", method = RequestMethod.POST)
	public void deleteMyticket(String ticketno, HttpServletResponse response, HttpServletRequest request) throws Exception {
		int result = service.deleteMyticket(ticketno);
		System.out.print(ticketno);
	
		 response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; charset=utf-8"); 
		 System.out.print(result);
		 if(result == 1) {
			 response.getWriter().println("<script>alert('예매가 취소되었습니다');location.href='"+request.getContextPath()+ "/myInfo'; </script>"); 
			 response.getWriter().flush(); 
		 }else{ 
			 response.getWriter().println("<script>alert('예매취소에 실패하였습니다.');location.href='"+request.getContextPath()+ "/myInfo'; </script>"); 
			 response.getWriter().flush(); 
		}
		 
	}

	// 내정보변경(비밀번호 확인 페이지)
	@RequestMapping(value = "/myInfo/changeMyinfo", method = RequestMethod.GET)
	public String changeMyinfoPre() {
		return "myInfo/checkPw";
	}


	// 비밀번호 확인 로직
	@RequestMapping(value = "/myInfo/confirmPw", method = RequestMethod.POST)
	public void confirmPw(MemberVO vo, Authentication auth, HttpServletResponse response,HttpServletRequest request) throws Exception {

		UserVO loginVO = (UserVO) auth.getPrincipal();
		MemberVO user = service.selectMyinfo(loginVO.getMid());

		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		boolean result = epwe.matches(vo.getMpw(), user.getMpw());

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		if (result) {
			response.getWriter().println("<script>location.href='" + request.getContextPath()+ "/myInfo/updateMyinfo'; </script>");
			response.getWriter().flush();
			
		} else {
			response.getWriter().println("<script>alert('비밀번호가 일치하기 않습니다.');location.href='" + request.getContextPath()+ "/myInfo/changeMyinfo'; </script>");
			response.getWriter().flush();
			
		}
	}
	// 비밀번호 확인 로직
	@ResponseBody
	@RequestMapping(value = "/myInfo/confirmPw2", method = RequestMethod.POST)
	public int confirmPw2(MemberVO vo, Authentication auth, HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		UserVO loginVO = (UserVO) auth.getPrincipal();
		MemberVO user = service.selectMyinfo(loginVO.getMid());
		
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		boolean result = epwe.matches(vo.getMpw(), user.getMpw());
		if(result) {
			return 1;
		}else {
			return 0;
		}
		
	}

	// 내정보변경(화면포워드)
	@RequestMapping(value = "/myInfo/updateMyinfo", method = RequestMethod.GET)
	public String changeMyinfo(Model model,MemberVO vo, Authentication auth) throws Exception{
		UserVO loginVO = (UserVO) auth.getPrincipal();
		MemberVO user = service.selectMyinfo(loginVO.getMid());
		model.addAttribute("user", user);
		
		return "myInfo/changeMyinfo";
	}

	@ResponseBody
	@RequestMapping(value = "/myInfo/checkEmail", method = RequestMethod.POST)
	public String checkEmail(String email) throws Exception {
		return Integer.toString(service.checkEmail(email));
	}


	// 내정보변경(업데이트)
	@RequestMapping(value = "/myInfo/changeMyinfo", method = RequestMethod.POST)
	public void changeMyinfoPost(MemberVO vo, Authentication auth, HttpServletResponse response,HttpServletRequest request ) throws Exception {
		
		UserVO loginVO = (UserVO)auth.getPrincipal();
		loginVO.setMname(vo.getMname());
		
		int result = service.updateMyinfo(vo, auth);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		if (result == 1) {
			response.getWriter().println("<script>alert('회원정보가 변경되었습니다.');location.href='" + request.getContextPath()+ "/myInfo'; </script>");
			response.getWriter().flush();
		} else {
			response.getWriter().println("<script>alert('회원정보 변경에 실패하였습니다.');location.href='" + request.getContextPath()+ "/myInfo'; </script>");
			response.getWriter().flush();
		}

	}

	// 회원탈퇴
	@RequestMapping(value = "/myInfo/withdrawal", method = RequestMethod.GET)
	public String withdrawal() {

		return "myInfo/withdrawal";
	}

	// 비밀번호 확인->탈퇴
	@RequestMapping(value = "/myInfo/withdrawal", method = RequestMethod.POST)
	public void withdrawl(MemberVO vo, Authentication auth, HttpServletResponse response, HttpSession session,
			HttpServletRequest request) throws Exception {
		UserVO loginVO = (UserVO) auth.getPrincipal();
		MemberVO user = service.selectMyinfo(loginVO.getMid());

		int resultDel = service.deleteMyinfo(user);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		if (resultDel == 0) {
			response.getWriter().println("<script>alert('회원탈퇴에 실패하였습니다.'); location.href='"
						+ request.getContextPath() + "/myInfo'; </script>");
				response.getWriter().flush();
		} else if (resultDel == 1) {
				response.getWriter().println("<script>alert('회원탈퇴가 성공적으로 진행되었습니다');location.href='"
						+ request.getContextPath() + "/myInfo';  </script>");
				response.getWriter().flush();

				SecurityContextHolder.clearContext(); // SecurityContext 초기화
				session.invalidate(); // HttpSession 무효화

				// 로그아웃 처리
				SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
				logoutHandler.logout(request, null, null);
			
		} 


		}

	}


