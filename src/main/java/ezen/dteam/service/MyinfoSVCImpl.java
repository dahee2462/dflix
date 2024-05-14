package ezen.dteam.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import ezen.dteam.dao.MyinfoDAO;
import ezen.dteam.vo.MemberVO;
import ezen.dteam.vo.TicketDetailVO;
import ezen.dteam.vo.TicketVO;
import ezen.dteam.vo.UserVO;

@Service
public class MyinfoSVCImpl implements MyinfoSVC{
	
	@Autowired
	MyinfoDAO myinfoDAO;

	@Override
	public MemberVO selectMyinfo(String mid) throws Exception {
		return myinfoDAO.selectMyinfo(mid);
	}
	
	@Override
	public int updateMyinfo(MemberVO vo,Authentication auth) throws Exception{
		UserVO loginVO = (UserVO)auth.getPrincipal();
		MemberVO user =  myinfoDAO.selectMyinfo(loginVO.getMid());
		
		MemberVO newvo = new MemberVO();
		newvo.setMid(loginVO.getMid());

		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		
		newvo.setMname(Optional.ofNullable(vo.getMname()).orElse(loginVO.getMname()));
		newvo.setMpw(Optional.ofNullable(epwe.encode(vo.getMpw())).orElse(loginVO.getMpw()));
		newvo.setMemail(Optional.ofNullable(vo.getMemail()).orElse(loginVO.getMemail()));
		newvo.setMphone(Optional.ofNullable(vo.getMphone()).orElse(loginVO.getMphone()));
		newvo.setMbirth(Optional.ofNullable(vo.getMbirth()).orElse(loginVO.getMbirth()));
		newvo.setMgender(Optional.ofNullable(vo.getMgender()).orElse(loginVO.getMgender()));
		
		
		/*
		 * String mname = vo.getMname(); if (mname == null || mname.isEmpty()) {
		 * newvo.setMname(loginVO.getMname()); } else { newvo.setMname(mname); } String
		 * mpw = vo.getMpw(); if (mpw == null || mpw.isEmpty()) {
		 * newvo.setMpw(loginVO.getMpw()); } else { newvo.setMpw(mpw); } String memail =
		 * vo.getMemail(); if (memail == null || memail.isEmpty()) {
		 * newvo.setMemail(loginVO.getMemail()); } else { newvo.setMemail(memail); }
		 * String mphone = vo.getMphone(); if (mpw == null || mpw.isEmpty()) {
		 * newvo.setMphone(loginVO.getMphone()); } else { newvo.setMphone(mphone); }
		 * String mbirth = vo.getMbirth(); if (mbirth == null || mbirth.isEmpty()) {
		 * newvo.setMbirth(loginVO.getMbirth()); } else { newvo.setMbirth(mbirth); }
		 * String mgender = vo.getMgender(); if (mgender == null || mgender.isEmpty()) {
		 * newvo.setMgender(loginVO.getMgender()); } else { newvo.setMgender(mgender); }
		 */
		
		System.out.print(myinfoDAO.updateMyinfo(newvo));
		return myinfoDAO.updateMyinfo(newvo);
	}

	@Override
	public int checkEmail(String email) throws Exception {
		return myinfoDAO.checkEmail(email);
	}

	@Override
	public int deleteMyinfo(MemberVO vo) throws Exception {
		return myinfoDAO.deleteMyinfo(vo);
	}

	@Override
	public List<TicketVO> selectMyticket(String mno) throws Exception {
		return myinfoDAO.selectMyticket(mno);
	}
	
	@Override
	public List<TicketDetailVO> selectTicketDetail(String ticketno) throws Exception{
		return myinfoDAO.selectTicketDetail(ticketno);
	}

	@Override
	public int deleteMyticket(String ticketno) throws Exception {
		return myinfoDAO.deleteMyticket(ticketno);
	}
}