package ezen.dteam.service;

import java.util.List;

import ezen.dteam.vo.CinemaReplyVO;
import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.PagingVO;

public interface MovieSVC {
	public List<CinemaVO> selectBoxOfficeCinema(PagingVO pagingVO)throws Exception;
	public List<CinemaVO> selectUnopen(PagingVO pagingVO)throws Exception;
	public int selectAllCnt()throws Exception;
	public int selectAllCntUnopen()throws Exception;
	public CinemaVO selectMovieDetail(String cno) throws Exception;
	public List<CinemaReplyVO> selectReplyCno(String cno) throws Exception;
	public int insertReply(CinemaReplyVO vo) throws Exception;
	public int updateReply(CinemaReplyVO vo) throws Exception;
	public int deleteReply(String ccmtno) throws Exception;
}
