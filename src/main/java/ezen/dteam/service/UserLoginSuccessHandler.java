package ezen.dteam.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import ezen.dteam.vo.MemberVO;
import ezen.dteam.vo.UserVO;


public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	SqlSession sqlSession;

	public UserLoginSuccessHandler() {}
	public UserLoginSuccessHandler(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		//경우1 : 로그인 인증을 위해 Spring Security가 요청을 가로챈 경우
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		//경우2 : 사용자가 직접 로그인 버튼을 누른 경우
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		if(prevPage!=null) request.getSession().removeAttribute("prevPage");
		
		String uri = request.getContextPath();
		//경우1 일 경우 uri에 경로 저장
		if(savedRequest!=null) uri = savedRequest.getRedirectUrl();
		//경우2 일 경우 uri에 경로 저장
		else if(prevPage!=null) uri = prevPage;
		
		//(추가)
		UserVO loginUser = (UserVO)authentication.getPrincipal();
		MemberVO user =sqlSession.selectOne("ezen.dteam.mapper.userMapper.selectLogin",loginUser.getMid());
		user.setMpw(null);
		
		
		
		response.sendRedirect(request.getContextPath());
	}

}
