package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.CinemaReplyVO;
import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.PagingVO;

@Repository
public class MovieDAO {
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.movieMapper";
	
	public List<CinemaVO> selectBoxOfficeCinema(PagingVO pagingVO){
		return sqlSession.selectList(nameSpace+".selectBoxOfficeCinema",pagingVO);
	}
	
	public List<CinemaVO> selectUnopen(PagingVO pagingVO){
		return sqlSession.selectList(nameSpace+".selectUnopen",pagingVO);
	}
	//페이징
	public int selectAllCnt() {
		return sqlSession.selectOne(nameSpace+".selectAllCnt");
	}
	public int selectAllCntUnopen() {
		return sqlSession.selectOne(nameSpace+".selectAllCntUnopen");
	}
	
	//영화 상세정보 조회
	public CinemaVO selectMovieDetail(String cno){
		return sqlSession.selectOne(nameSpace+".selectMovieDetail",cno);
	}
	
	//(영화상세)댓글 목록 조회
	public List<CinemaReplyVO> selectReplyCno(String cno){
		return sqlSession.selectList(nameSpace+".selectReplyCno",cno);
	}
	//댓글 삽입
	public int insertReply(CinemaReplyVO vo) {
		return sqlSession.insert(nameSpace+".insertReply", vo);
	}
	//댓글 수정
	public int updateReply(CinemaReplyVO vo) {
		return sqlSession.update(nameSpace+".updateReply", vo);
	}
	//댓글 삭제
	public int deleteReply(String ccmtno) {
		return sqlSession.delete(nameSpace+".deleteReply",ccmtno);
	}
}
