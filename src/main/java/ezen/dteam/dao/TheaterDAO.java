package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.ScreenHallVO;
import ezen.dteam.vo.ScreenVO;
import ezen.dteam.vo.TheaterVO;

@Repository
public class TheaterDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace="ezen.dteam.mapper.theaterMapper";
	
		public TheaterVO selectAllTheater(String tno){
			return sqlSession.selectOne(nameSpace+".selectAllTheater",tno);
		}
	
		public List<ScreenVO> selectScreenofTnoSday(TheaterVO theaterVO){
			return sqlSession.selectList(nameSpace+".selectScreenofTnoSday",theaterVO);
		}
		
		public CinemaVO selectCinemaofCno(int cno){
			return sqlSession.selectOne(nameSpace+".selectCinemaofCno",cno);
		}
		
		public ScreenHallVO selectScreenHallofShallno(int shallno){
			return sqlSession.selectOne(nameSpace+".selectScreenHallofShallno",shallno);
		}
		
		public String selectShallSeatofSno(int sno){
			return sqlSession.selectOne(nameSpace+".selectShallSeatofSno",sno);
		}
		
		public int selectfillSeatofSno(int sno){
			return sqlSession.selectOne(nameSpace+".selectfillSeatofSno",sno);
		}
		
}
