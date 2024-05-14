
package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.BoardVO;
import ezen.dteam.vo.IcmtReplyVO;
import ezen.dteam.vo.PagingVO;

@Repository
public class admInquiryDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.admInquiryMapper";
	
	public int selectBoardAllCnt() {
		return sqlSession.selectOne(nameSpace+".selectAllCnt");
	}
	
	public List<BoardVO> selectBoardAll(PagingVO pagingVO){
		return sqlSession.selectList(nameSpace+".selectAll",pagingVO);
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
	
	public int deleteBoard(String bno) {
		return sqlSession.delete(nameSpace+".deleteboard",bno);
	}
	
	public int midtomno(String mid) {
		return sqlSession.selectOne(nameSpace+".midtomno",mid);
	}
	
	public int replyWrite(IcmtReplyVO icmtReplyVO) {
		return sqlSession.insert(nameSpace+".updateReply",icmtReplyVO);
	}
	
	public List<IcmtReplyVO> selectReplyBno(String bno) {
		return sqlSession.selectList(nameSpace+".selectReplyBno",bno);
	}
	
	public int deleteReply(String icmtno) {
		return sqlSession.delete(nameSpace+".deleteReply",icmtno);
	}
	
}
