package ezen.dteam.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dteam.dao.admTheatersDAO;
import ezen.dteam.vo.ScreenHallVO;
import ezen.dteam.vo.ScreenVO;

@RequestMapping(value = "/admin/theaters")
@Controller
public class AdmTheaters {
	
	@Autowired
	admTheatersDAO admTheatersDAO;
	
	@RequestMapping(value = "theatersMgList", method = RequestMethod.GET)
	public String theatersMgList(Model model) {
		model.addAttribute("TheaterVOList",admTheatersDAO.selectAllTheater());
		return "/admin/theaters/theatersMgList";
	}
	
	@RequestMapping(value = "theatersMgView", method = RequestMethod.GET)
	public String theatersMgView(Model model, String tno, String attendday) {
		
		if(attendday == null || attendday.equals("")) {
			LocalDate now = LocalDate.now();        
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");        
			attendday = now.format(formatter); 
		}
		
		List<ScreenHallVO> ScreenHallVOList = admTheatersDAO.selectScreenHallofTno(tno);
		for(ScreenHallVO screenHallVO :ScreenHallVOList) {
			ScreenVO screenVO = new ScreenVO(screenHallVO.getShallno(),attendday);
			screenHallVO.setScreenVO(admTheatersDAO.selectScreenofshallno(screenVO));
		}
		
		model.addAttribute("ScreenHallVOList",ScreenHallVOList);
		
		model.addAttribute("CinemaVOList",admTheatersDAO.selectCinema());
		
	
		
		return "/admin/theaters/theatersMgView";
	}
	
	@RequestMapping(value = "theatersMgViewInsert", method = RequestMethod.POST)
	public String theatersMgViewInsert(HttpServletResponse response, @RequestParam(value="shallno", required=false)String shallnoParam, 
			@RequestParam("cno")String cnoParam, String sstartTime, @RequestParam("attendday2")String sday, String tno) throws IOException {
		int cno = 0;
		if(cnoParam != null && !cnoParam.equals("")){
			cno = Integer.parseInt(cnoParam);
		}
		
		int shallno = 0;
		if(shallnoParam != null && !shallnoParam.equals("")){
			shallno = Integer.parseInt(shallnoParam);
		}
		if(shallno == 0) {
			return "redirect:/admin/theaters/theatersMgView?tno="+tno;
		}
		
		String cshowTimeParam = admTheatersDAO.selectCshowTimeofCno(cno);
		int cshowTime = 120;
		if(cshowTimeParam != null && !cshowTimeParam.equals("")){
			cshowTime = Integer.parseInt(cshowTimeParam);
		}
		
		int cshowTimeHour = cshowTime/60;
		
		int cshowTimeMin = cshowTime%60;
		
		String[] sstartTimeArray = sstartTime.split(":");
		int hour = Integer.parseInt(sstartTimeArray[0]);
		int min = Integer.parseInt(sstartTimeArray[1]);
		
		String sendTime = (cshowTimeHour+hour)+":"+(cshowTimeMin+min);
		
		
		
		ScreenVO screenVO = new ScreenVO(sstartTime, sendTime, cno, shallno, sday);
		int result = admTheatersDAO.insertScreen(screenVO);
		
		return "redirect:/admin/theaters/theatersMgView?tno="+tno+"&attendday="+sday;
		
	}


	@RequestMapping(value = "screenDelete", method = RequestMethod.POST)
	public String screenDelete(String sno, String tno, String attendday) {
		int result = admTheatersDAO.screenDelete(sno);
		
		return "redirect:/admin/theaters/theatersMgView?tno="+tno+"&attendday="+attendday;
	}



}






