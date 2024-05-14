package ezen.dteam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dteam.dao.MainDAO;
import ezen.dteam.vo.CinemaVO;

@Service
public class MainSVCImpl implements MainSVC{
	
	@Autowired
	MainDAO mainDAO;
	
	@Override
	public List<CinemaVO> selectBoxOfficeCinema(){
		return mainDAO.selectBoxOfficeCinema();
	}

	@Override
	public List<CinemaVO> selectUnopen() {
		return mainDAO.selectUnopen();
	}
	
	
}