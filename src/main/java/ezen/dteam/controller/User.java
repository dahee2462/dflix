package ezen.dteam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.dteam.service.UserSVCImpl;
import ezen.dteam.vo.MemberVO;

//@RequestMapping(value="/user")
@Controller
public class User {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	UserSVCImpl service;
	
	@RequestMapping(value = "/login")
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	public String checkId(String id) throws Exception {
		return Integer.toString(service.checkId(id));
	}
	
	@ResponseBody
	@RequestMapping(value="/checkNickNm", method=RequestMethod.POST)
	public String checkNickNm(String nickNm) throws Exception {
		return Integer.toString(service.checkNickNm(nickNm));
	}
	
	@ResponseBody
	@RequestMapping(value="/checkEmail", method=RequestMethod.POST)
	public String checkEmail(String email) throws Exception {
		return Integer.toString(service.checkEmail(email));
	}
	
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public String joinOk(String mid,String mpw, String mname,String authority, String enabled,
			String mnickNm, String mbirth, String memail,String mgender, String mphone) {
		

		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		
		Map<String,Object> vo = new HashMap<String,Object>();
		vo.put("mid", mid);
		vo.put("mpw",epwe.encode(mpw));
		vo.put("mname", mname);
		vo.put("mnickNm", mnickNm);
		vo.put("mbirth", mbirth);
		vo.put("memail", memail);
		vo.put("mphone", mphone);
		vo.put("mgender", mgender);		
		vo.put("enabled", enabled);		
		vo.put("authority", authority);
		
		sqlSession.insert("ezen.dteam.mapper.userMapper.insert",vo);
		
		return "redirect:/user/login";
	}
	
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() throws Exception{
		
		return "user/findId";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchId", method = RequestMethod.POST)
	public String searchId(MemberVO vo) throws Exception{
		return service.searchId(vo);
		
	}
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() throws Exception{
		
		return "user/findPw";
	}
	
	
	
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public void sendEmail(MemberVO vo,HttpServletResponse response, HttpServletRequest request) throws Exception{

		//4. 알림발송
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		if(service.updatePw(vo)==1) {
			response.getWriter().println("<script>alert('인증번호가 발송되었습니다'); location.href='"+request.getContextPath()+"/user/login'; </script>");
			
		} else {
			response.getWriter().println("<script>alert('인증번호 발송에 실패하였습니다.'); location.href='"+request.getContextPath()+"/user/login'; </script>");
		}
		response.getWriter().flush();
		
	}
	
	
}
