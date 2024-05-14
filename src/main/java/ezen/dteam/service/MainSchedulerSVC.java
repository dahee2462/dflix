package ezen.dteam.service;

import ezen.dteam.vo.CinemaVO;

public interface MainSchedulerSVC {

	int upsertMovieList(CinemaVO cinema);
	
	int updateMovieRankNull(CinemaVO cinema);
	
	int updateMovieRank(CinemaVO cinema);
}
