package ezen.dteam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dteam.vo.CinemaVO;

@Repository
public class MainDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String nameSpace = "ezen.dteam.mapper.mainMapper";
	
	public List<CinemaVO> selectBoxOfficeCinema(){
		return sqlSession.selectList(nameSpace+".selectBoxOfficeCinema");
	}
	
	public List<CinemaVO> selectUnopen(){
		return sqlSession.selectList(nameSpace+".selectUnopen");
	}
	
}
