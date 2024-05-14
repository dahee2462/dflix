package ezen.dteam.service;

import java.util.List;

import ezen.dteam.vo.CinemaVO;

public interface MainSVC {
	
	List<CinemaVO> selectBoxOfficeCinema();
	
	List<CinemaVO> selectUnopen();
}
