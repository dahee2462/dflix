package ezen.dteam.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.CinemaVO;

@Repository
public class MainSchedulerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.mainMapper";
	
	public int upsertMovieList(CinemaVO cinema) {
		return sqlSession.insert(nameSpace+".upsertMovieList", cinema);
	}
	
	public int updateMovieRankNull(CinemaVO cinema) {
		return sqlSession.update(nameSpace+".updateMovieRankNull", cinema);
	}
	
	public int updateMovieRank(CinemaVO cinema) {
		return sqlSession.update(nameSpace+".updateMovieRank", cinema);
	}

}
