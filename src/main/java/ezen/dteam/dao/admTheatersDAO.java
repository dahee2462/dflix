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
public class admTheatersDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.admTheatersMapper";
	
	public List<TheaterVO> selectAllTheater() {
		return sqlSession.selectList(nameSpace+".selectAllTheater");
	}
	
	public List<ScreenHallVO> selectScreenHallofTno(String tno){
		return sqlSession.selectList(nameSpace+".selectAllScreenHallofTno", tno);
	}
	
	public List<ScreenVO> selectScreenofshallno(ScreenVO screenVO){
		return sqlSession.selectList(nameSpace+".selectScreenofshallno", screenVO);
	}
	
	public List<CinemaVO> selectCinema(){
		return sqlSession.selectList(nameSpace+".selectCinema");
	}
	
	public String selectCshowTimeofCno(int cno) {
		return sqlSession.selectOne(nameSpace+".selectCshowTimeofCno",cno);
	}
	
	public int insertScreen(ScreenVO screenVO) {
		return sqlSession.insert(nameSpace+".insertScreen",screenVO);
	}
	
	public int screenDelete(String sno) {
		return sqlSession.insert(nameSpace+".screenDelete",sno);
	}
	
}
