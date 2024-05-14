package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.BoardVO;
import ezen.dteam.vo.IcmtReplyVO;
import ezen.dteam.vo.PagingVO;

@Repository
public class ServiceCenterDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.serviceCenterMapper";
	
	public int selectBoardAllCnt() {
		return sqlSession.selectOne(nameSpace+".selectAllCnt");
	}
	
	public List<BoardVO> selectBoardAll(PagingVO pagingVO){
		return sqlSession.selectList(nameSpace+".selectAll",pagingVO);
	}
	
	
	public int selectBoardAllCntInquiry() {
		return sqlSession.selectOne(nameSpace+".selectAllCntInquiry");
	}
	
	public List<BoardVO> selectBoardAllInquiry(PagingVO pagingVO){
		return sqlSession.selectList(nameSpace+".selectAllInquiry",pagingVO);
	}
	
	
	
	
	public BoardVO selectBoardBno(String bno) {
		return sqlSession.selectOne(nameSpace+".selectboardofbno",bno);
	}
	
	public BoardVO selectPreBno(String bno) {
		return sqlSession.selectOne(nameSpace+".selectprebno",bno);
	}

	public BoardVO selectNextBno(String bno) {
		return sqlSession.selectOne(nameSpace+".selectnextbno",bno);
	}
	
	public BoardVO selectPreBnoInquiry(String bno) {
		return sqlSession.selectOne(nameSpace+".selectprebnoInquiry",bno);
	}

	public BoardVO selectNextBnoInquiry(String bno) {
		return sqlSession.selectOne(nameSpace+".selectnextbnoInquiry",bno);
	}
	
	public List<IcmtReplyVO> selectReplyBno(String bno) {
		return sqlSession.selectList(nameSpace+".selectReplyBno",bno);
	}
	
	public int insertInquiry(BoardVO boardVO) {
		return sqlSession.insert(nameSpace+".insertInquiry",boardVO);
	}
	
	public int midtomno(String mid) {
		return sqlSession.selectOne(nameSpace+".midtomno",mid);
	}
	
}
