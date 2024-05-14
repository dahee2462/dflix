package ezen.dteam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dteam.dao.MainSchedulerDAO;
import ezen.dteam.vo.CinemaVO;

@Service
public class MainSchedulerSVCImpl implements MainSchedulerSVC {
	
	@Autowired
	MainSchedulerDAO mainSchedulerDAO;
	
	@Override
	public int upsertMovieList(CinemaVO cinema) {
		return mainSchedulerDAO.upsertMovieList(cinema);
	}
	
	@Override
	public int updateMovieRankNull(CinemaVO cinema) {
		return mainSchedulerDAO.updateMovieRankNull(cinema);
	}

	@Override
	public int updateMovieRank(CinemaVO cinema) {
		return mainSchedulerDAO.updateMovieRank(cinema);
	}


}
