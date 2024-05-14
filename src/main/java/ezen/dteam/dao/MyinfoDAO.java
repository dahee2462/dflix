package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.MemberVO;
import ezen.dteam.vo.TicketDetailVO;
import ezen.dteam.vo.TicketVO;

@Repository
public class MyinfoDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.myinfoMapper";
	

	public MemberVO selectMyinfo(String mid) throws Exception{
		return sqlSession.selectOne(nameSpace+".selectMyinfo", mid);
	}
	public int checkEmail(String email) throws Exception{
		return sqlSession.selectOne(nameSpace+".checkEmail",email);
	}
	
	public int updateMyinfo(MemberVO vo) throws Exception{
		return sqlSession.update(nameSpace+".updateMyinfo",vo);
	}
	public int deleteMyinfo(MemberVO vo) throws Exception{
		return sqlSession.update(nameSpace+".deleteMyinfo",vo);
	}
	//티켓
	public List<TicketVO> selectMyticket(String mno)throws Exception{
		return sqlSession.selectList(nameSpace+".selectMyticket", mno);
	}
	public List<TicketDetailVO> selectTicketDetail(String ticketno)throws Exception{
		return sqlSession.selectList(nameSpace+".selectTicketDetail",ticketno);
	}
	public int deleteMyticket(String ticketno)throws Exception{
		return sqlSession.update(nameSpace+".deleteMyticket",ticketno);
	}
}
