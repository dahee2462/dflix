package ezen.dteam.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dteam.dao.TheaterDAO;
import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.ScreenHallVO;
import ezen.dteam.vo.ScreenVO;
import ezen.dteam.vo.TheaterVO;

@Controller
public class Theater {
	
	
	@Autowired
	TheaterDAO theaterDAO;
	
	@RequestMapping(value="/theater", method=RequestMethod.GET)
	public String theater(Model model, @RequestParam("tno")String tnoParam, String attendday) {
		
		int tno;
		try {
			tno = Integer.parseInt(tnoParam);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return "redirect:/";
		}
		
		if(attendday == null || attendday.equals("")) {
			LocalDate now = LocalDate.now();        
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");        
			attendday = now.format(formatter); 
		}
		
		
		
		Set<Integer> checkCno = new HashSet<Integer>();
		Set<Integer> checkShallno = new HashSet<Integer>();
		
		CinemaVO cinemaVO = null;
		ScreenHallVO screenHallVO = null;
		
		
		List<CinemaVO> cinemaVOList = new ArrayList<CinemaVO>();
		
		List<ScreenVO> screenList = theaterDAO.selectScreenofTnoSday(new TheaterVO(tno, attendday));
		
		for(ScreenVO screenVO : screenList) {
			int screenSno = screenVO.getSno();
			
			screenVO.setShallSeat(theaterDAO.selectShallSeatofSno(screenSno));
			screenVO.setFillSeat(theaterDAO.selectfillSeatofSno(screenSno));
			
			
			int screenCno = screenVO.getCno();
			int screenShallno = screenVO.getShallno();
			
			if(!checkCno.contains(screenCno)) {
				
				cinemaVO = theaterDAO.selectCinemaofCno(screenCno);
				cinemaVO.setScreenHallVOList(new ArrayList<ScreenHallVO>());
				cinemaVOList.add(cinemaVO);
				
				screenHallVO = theaterDAO.selectScreenHallofShallno(screenShallno);
				screenHallVO.setScreenVO(new ArrayList<ScreenVO>());
				cinemaVO.getScreenHallVOList().add(screenHallVO);
				
				screenHallVO.getScreenVO().add(screenVO);
				
				checkCno.add(screenCno);
				checkShallno.add(screenShallno);
				
			} else if(!checkShallno.contains(screenVO.getShallno())) {
				
				
				for(CinemaVO cinemaVOvar2 : cinemaVOList) {
					if(cinemaVOvar2.getCno() == screenCno) {
						cinemaVO = cinemaVOvar2;
						break;
					}
				}
				
				screenHallVO = theaterDAO.selectScreenHallofShallno(screenShallno);
				screenHallVO.setScreenVO(new ArrayList<ScreenVO>());
				cinemaVO.getScreenHallVOList().add(screenHallVO);
				
				screenHallVO.getScreenVO().add(screenVO);
				
				checkShallno.add(screenShallno);
					
			} else {
				for(CinemaVO cinemaVOvar3 : cinemaVOList) {
					for(ScreenHallVO screenHallVOVar : cinemaVOvar3.getScreenHallVOList()) {
						if(screenHallVOVar.getShallno() == screenShallno && cinemaVOvar3.getCno() == screenCno) {
							screenHallVO = screenHallVOVar;
							break;
						}
					}
				}
				
				screenHallVO.getScreenVO().add(screenVO);
				
			}
			
		}
		
		for(CinemaVO cinemaVOvar4 : cinemaVOList) {
			String CwatchGradeNm = cinemaVOvar4.getCwatchGradeNm();
			if(CwatchGradeNm == null || (CwatchGradeNm != null && CwatchGradeNm.equals(""))){
				cinemaVOvar4.setCwatchGradeNm("전체관람가");
			}
		}
		
		
		model.addAttribute("cinemaVOList",cinemaVOList);
		
		model.addAttribute("theaterVO",theaterDAO.selectAllTheater(tnoParam));
		
		return "theater/theater";
	}

}
