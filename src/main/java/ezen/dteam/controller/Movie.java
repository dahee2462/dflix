package ezen.dteam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ezen.dteam.service.MovieSVCImpl;
import ezen.dteam.vo.CinemaReplyVO;
import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.PagingVO;
import ezen.dteam.vo.UserVO;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@RequestMapping(value="/movie")
@Controller
public class Movie {
	@Autowired
	MovieSVCImpl movieService;
	
	@RequestMapping(value="/movieChart", method=RequestMethod.GET)
	public String movieChart(Model model, String nowPageParam) throws OpenAPIFault, Exception{
		//페이징
		int nowPage = 1;
		if(nowPageParam != null && !nowPageParam.equals("")) {
			nowPage = Integer.parseInt(nowPageParam);
		}
		int totalCnt = movieService.selectAllCnt();
		PagingVO pagingVO = new PagingVO(nowPage, totalCnt, 9);
		model.addAttribute("pagingVO", pagingVO);
		List<CinemaVO> movieChart = movieService.selectBoxOfficeCinema(pagingVO);	
		model.addAttribute("movieChart", movieChart);
		return "movie/movieChart";
	}
	@RequestMapping(value="/movieSchedule", method=RequestMethod.GET)
	public String movieSchedule(Model model, String nowPageParam) throws OpenAPIFault, Exception{
		int nowPage = 1;
		if(nowPageParam != null && !nowPageParam.equals("")) {
			nowPage = Integer.parseInt(nowPageParam);
		}
		int totalCnt = movieService.selectAllCntUnopen();
		PagingVO pagingVO = new PagingVO(nowPage, totalCnt, 9);
		model.addAttribute("pagingVO", pagingVO);
		List<CinemaVO> unopenMovie = movieService.selectUnopen(pagingVO);		
		model.addAttribute("unopenMovie", unopenMovie);
		return "movie/movieSchedule";
	}
	
	
	@RequestMapping(value="/movieView", method=RequestMethod.GET)
	public String movieView(String cno ,Model model, HttpServletResponse response) throws  Exception {
		//상세정보 조회
		CinemaVO movieDetail = movieService.selectMovieDetail(cno);
		model.addAttribute("movieDetail",movieDetail);
		
		//댓글목록 조회
		List<CinemaReplyVO> replyList = movieService.selectReplyCno(cno);
		model.addAttribute("replyList", replyList);
		return "movie/movieView";
	}
	//댓글 작성
	@RequestMapping(value="/replyWrite", method=RequestMethod.POST)
	public void replyWrite(String ccmtContent, String cno,  Authentication authentication, HttpServletResponse response)throws IOException{
		//로그인된 유저 가져오기
		UserVO loginVO = (UserVO)authentication.getPrincipal();
		int mno = loginVO.getMno();
		CinemaReplyVO cr = new CinemaReplyVO(mno, cno, ccmtContent);
		int result = movieService.insertReply(cr);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			response.getWriter().append("<script>alert('댓글 작성이 완료되었습니다.');location.href='movieView?cno="+cno+"';</script>");
		}else {
			response.getWriter().append("<script>alert('댓글 작성이 완료되지 않았습니다.');location.href='movieView?cno="+cno+"';</script>");			
		}
		response.getWriter().flush();
		
	}
	//댓글 수정
	@RequestMapping(value="/replyUpdate", method=RequestMethod.POST)
	public void replyUpdate(CinemaReplyVO crvo, HttpServletResponse response) throws IOException{
		int result = movieService.updateReply(crvo);
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			response.getWriter().append("<script>alert('댓글이 수정되었습니다.');location.href='movieView?cno="+crvo.getCno()+"';</script>");
		}else {
			response.getWriter().append("<script>alert('댓글이 수정되지 않았습니다.');location.href='movieView?cno="+crvo.getCno()+"';</script>");			
		}
		response.getWriter().flush();
	}
	
	//댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public void replyDelete(String cno, String ccmtno, HttpServletResponse response) throws IOException {
		
		int result = movieService.deleteReply(ccmtno);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			response.getWriter().append("<script>alert('댓글이 삭제되었습니다');location.href='movieView?cno="+cno+"';</script>");
		}else {
			response.getWriter().append("<script>alert('댓글이 삭제되지 않았습니다');location.href='movieView?cno="+cno+"';</script>");			
		}
		response.getWriter().flush();
		
	}
}
