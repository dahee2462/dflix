package ezen.dteam.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import ezen.dteam.vo.MemberVO;
import ezen.dteam.vo.TicketDetailVO;
import ezen.dteam.vo.TicketVO;

public interface MyinfoSVC {
	
	public MemberVO selectMyinfo(String mid) throws Exception;
	public int checkEmail(String email) throws Exception;
	public int updateMyinfo(MemberVO vo, Authentication auth) throws Exception;
	public int deleteMyinfo(MemberVO vo) throws Exception;
	public List<TicketVO> selectMyticket(String mno) throws Exception;
	public List<TicketDetailVO> selectTicketDetail(String ticketno) throws Exception;
	public int deleteMyticket(String ticketno) throws Exception;
}
