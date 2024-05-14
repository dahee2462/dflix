package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.BoardVO;
import ezen.dteam.vo.PagingVO;

@Repository
public class admNoticeDAO {

	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.admNoticeMapper";
	
	public int selectBoardAllCnt() {
		return sqlSession.selectOne(nameSpace+".selectAllCnt");
	}
	
	public List<BoardVO> selectBoardAll(PagingVO pagingVO){
		return sqlSession.selectList(nameSpace+".selectAll",pagingVO);
	}
	
	public BoardVO selectBoardBno(String bno) {
		return sqlSession.selectOne(nameSpace+".selectboardofbno",bno);
	}
	
	public int insertNotice(BoardVO boardVO) {
		return sqlSession.insert(nameSpace+".insertNotice",boardVO);
	}
	
	public int deleteBoard(String bno) {
		return sqlSession.delete(nameSpace+".deleteboard",bno);
	}
	
	public int updateBoard(BoardVO boardVO) {
		return sqlSession.update(nameSpace+".updateNotice",boardVO);
	}
	
}
