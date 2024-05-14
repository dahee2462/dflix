package ezen.dteam.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ezen.dteam.dao.admInquiryDAO;
import ezen.dteam.vo.IcmtReplyVO;
import ezen.dteam.vo.PagingVO;
import ezen.dteam.vo.UserVO;

@RequestMapping(value = "/admin/inquiry")
@Controller
public class AdmInquiry {
	
	@Autowired
	admInquiryDAO admInquiryDAO;
	 
	@RequestMapping(value = "/inquiryList", method = RequestMethod.GET)
	public String inquiryList(Model model, String nowPageParam) {
		
		int nowPage = 1;
		if(nowPageParam != null && !nowPageParam.equals("")){
			nowPage = Integer.parseInt(nowPageParam);
		}
		
		int totalCnt = admInquiryDAO.selectBoardAllCnt();
		
		PagingVO pagingVO = new PagingVO(nowPage, totalCnt, 5);
		
		model.addAttribute("pagingVO", pagingVO);
		
		model.addAttribute("board", admInquiryDAO.selectBoardAll(pagingVO));
		
		return "/admin/inquiry/inquiryList";
	}
	
	@RequestMapping(value = "/inquiryView", method = RequestMethod.GET)
	public String inquiryView(Model model, String bno) {
		
		model.addAttribute("boardVO",admInquiryDAO.selectBoardBno(bno));
		
		model.addAttribute("preBoardVO",admInquiryDAO.selectPreBno(bno));
		model.addAttribute("nextBoardVO",admInquiryDAO.selectNextBno(bno));
		
		model.addAttribute("replyList",admInquiryDAO.selectReplyBno(bno));
		
		return "/admin/inquiry/inquiryView";
	}
	
	@RequestMapping(value = "/inquiryDelete", method = RequestMethod.POST)
	public void inquiryDelete(String bno, HttpServletResponse response) throws IOException {
		
		int result = admInquiryDAO.deleteBoard(bno);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		if(result>0) {
			response.getWriter().append("<script>alert('삭제되었습니다.');location.href='inquiryList';</script>");
		}else {
			response.getWriter().append("<script>alert('삭제되지 않았습니다.');location.href='inquiryList';</script>");			
		}
		response.getWriter().flush();
		
	}
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public void replyWrite(String replyContent, String bno, Authentication authentication, HttpServletResponse response) throws IOException {
		UserVO loginUser = (UserVO)authentication.getPrincipal();
		
		String mid = loginUser.getMid();
		int mno = admInquiryDAO.midtomno(mid);
		
		IcmtReplyVO icmtReplyVO = new IcmtReplyVO(replyContent,bno,mno);
		
		int result = admInquiryDAO.replyWrite(icmtReplyVO);
		
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			response.getWriter().append("<script>alert('댓글을 작성했습니다.');location.href='inquiryView?bno="+bno+"';</script>");
		}else {
			response.getWriter().append("<script>alert('댓글이 작성되지 않았습니다.');location.href='inquiryView?bno="+bno+"';</script>");			
		}
		response.getWriter().flush();
		
	}
	
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public void replyDelete(String icmtno, String bno, HttpServletResponse response) throws IOException {
		
		int result = admInquiryDAO.deleteReply(icmtno);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			response.getWriter().append("<script>alert('댓글이 삭제되었습니다.');location.href='inquiryView?bno="+bno+"';</script>");
		}else {
			response.getWriter().append("<script>alert('댓글이 삭제되지 않았습니다.');location.href='inquiryView?bno="+bno+"';</script>");			
		}
		response.getWriter().flush();
		
	}
	
}
