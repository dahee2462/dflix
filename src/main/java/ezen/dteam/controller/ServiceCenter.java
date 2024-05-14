package ezen.dteam.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ezen.dteam.dao.ServiceCenterDAO;
import ezen.dteam.vo.BoardVO;
import ezen.dteam.vo.PagingVO;
import ezen.dteam.vo.UserVO;

@RequestMapping(value = "/serviceCenter")
@Controller
public class ServiceCenter {
	
	@Autowired
	ServiceCenterDAO serviceCenterDAO;
	
	
	//1.������ - ����
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model, String nowPageParam) {
		int nowPage = 1;
		if(nowPageParam != null && !nowPageParam.equals("")){
			nowPage = Integer.parseInt(nowPageParam);
		}
		
		int totalCnt = serviceCenterDAO.selectBoardAllCnt();
		
		PagingVO pagingVO = new PagingVO(nowPage, totalCnt, 5);
		
		model.addAttribute("pagingVO", pagingVO);
		
		model.addAttribute("board", serviceCenterDAO.selectBoardAll(pagingVO));
		
		return "/serviceCenter/noticeList";
	}
	
	@RequestMapping(value = "/noticeView", method = RequestMethod.GET)
	public String noticeView(Model model, String bno) {
		model.addAttribute("boardVO",serviceCenterDAO.selectBoardBno(bno));
		model.addAttribute("preBoardVO",serviceCenterDAO.selectPreBno(bno));
		model.addAttribute("nextBoardVO",serviceCenterDAO.selectNextBno(bno));
		
		return "serviceCenter/noticeView";
	}
	
	
	//2.������- ����
	@RequestMapping(value = "/inquiryList", method = RequestMethod.GET)
	public String inquiryList(Model model, String nowPageParam) {
		int nowPage = 1;
		if(nowPageParam != null && !nowPageParam.equals("")){
			nowPage = Integer.parseInt(nowPageParam);
		}
		
		int totalCnt = serviceCenterDAO.selectBoardAllCntInquiry();
		
		PagingVO pagingVO = new PagingVO(nowPage, totalCnt, 5);
		
		model.addAttribute("pagingVO", pagingVO);
		
		model.addAttribute("board", serviceCenterDAO.selectBoardAllInquiry(pagingVO));
		
		return "serviceCenter/inquiryList";
	}
	
	@RequestMapping(value = "/inquiryView", method = RequestMethod.GET)
	public String inquiryView(Model model, String bno) {
		model.addAttribute("boardVO",serviceCenterDAO.selectBoardBno(bno));
		
		model.addAttribute("preBoardVO",serviceCenterDAO.selectPreBnoInquiry(bno));
		model.addAttribute("nextBoardVO",serviceCenterDAO.selectNextBnoInquiry(bno));
		
		model.addAttribute("replyList",serviceCenterDAO.selectReplyBno(bno));
		return "serviceCenter/inquiryView";
	}
	
	
	//������- ����- �ۼ�
	@RequestMapping(value = "/inquiryWrite", method = RequestMethod.GET)
	public String inquiryWrite() {
		return "serviceCenter/inquiryWrite";
	}
	
	@RequestMapping(value = "/inquiryWrite", method = RequestMethod.POST)
	public String inquiryWriteOk(Authentication authentication, HttpServletResponse response, String btitle, String bcontent) throws IOException {
		
		if(btitle == null || btitle.equals("")) {
			btitle = "제목 없음";
		}
		
		
		UserVO loginUser = (UserVO)authentication.getPrincipal();
		
		String mid = loginUser.getMid();
		int mno = serviceCenterDAO.midtomno(mid);
		
		BoardVO boardVO = new BoardVO(btitle, bcontent, mno);
		
		int result = serviceCenterDAO.insertInquiry(boardVO);
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			response.getWriter().append("<script>alert('문의를 작성했습니다.');location.href='inquiryList';</script>");
		}else {
			response.getWriter().append("<script>alert('문의가 작성되지 않았습니다.');location.href='inquiryList';</script>");			
		}
		response.getWriter().flush();
		return "serviceCenter/inquiryList";
	}
	
	
}
