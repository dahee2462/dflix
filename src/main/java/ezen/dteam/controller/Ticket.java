package ezen.dteam.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.dteam.service.TicketSVC;
import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.ScreenHallVO;
import ezen.dteam.vo.ScreenSeatVO;
import ezen.dteam.vo.ScreenVO;
import ezen.dteam.vo.TheaterVO;
import ezen.dteam.vo.TicketDetailVO;
import ezen.dteam.vo.UserVO;

@RequestMapping(value="/ticket")
@Controller
public class Ticket {
	
	@Autowired
	TicketSVC ticketSVC;
	
	@Autowired
	private HttpSession httpSession;

	@RequestMapping(value="/ticketing", method=RequestMethod.GET)
	public String ticketing(Model model) {
		
		List<TheaterVO> theater = ticketSVC.selectTheater();
		model.addAttribute("theater", theater);
		
		List<CinemaVO> movie = ticketSVC.selectMovie();
		model.addAttribute("movie", movie);
		
		
		return "ticket/ticketing";
	}
		
	@RequestMapping(value="/movieCode", method=RequestMethod.POST)
	@ResponseBody
	public List<CinemaVO> movieCodeNo(String movieCode) {
		
		List<CinemaVO> ccode = ticketSVC.selectMovieCode(movieCode);
		
		return ccode;
	}
	
	@RequestMapping(value="/tiketTheaterNo", method=RequestMethod.POST)
	@ResponseBody
	public List<ScreenHallVO> ticketTheaterNo(String tnoParam) {
		int tno = Integer.parseInt(tnoParam);
		
		List<ScreenHallVO> selectScreenHall = ticketSVC.selectScreenHall(tno);
		
		return selectScreenHall;
	}
	
	@RequestMapping(value="/selectScreen", method=RequestMethod.POST)
	@ResponseBody
	public List<ScreenVO> selectScreen(String cnoParam, String tnoParam, String sday){
		
		int cno = Integer.parseInt(cnoParam);
		int tno = Integer.parseInt(tnoParam);
		
		ScreenVO screenVO = new ScreenVO(cno, tno, sday);
		List<ScreenVO> selectScreen = ticketSVC.selectScreen(screenVO);
		
		return selectScreen;
	}
	
	@RequestMapping(value="/ticketSeat", method=RequestMethod.POST)
	public String ticketSeatPOST(Model model, @RequestParam("cno") int cno,
			@RequestParam("cposter") String cposter, @RequestParam("cname") String cname, 
			@RequestParam("cwatchGradeNm") String cwatchGradeNm, @RequestParam("tno") int tno,
			@RequestParam("tname") String tname, @RequestParam("inputDateDay") String dateDay,
			@RequestParam("sday") String sday, @RequestParam("sstartTime") String sstartTime,
			@RequestParam("shallno") int shallno, @RequestParam("shallType") String shallType,
			@RequestParam("shallLocation") String shallLocation, @RequestParam("sendTime") String sendTime, 
			@RequestParam("sno") int sno,
			Authentication authentication) throws Exception {
		
		model.addAttribute("cno", cno);
		model.addAttribute("cposter", cposter);
		model.addAttribute("cname", cname);
		model.addAttribute("cwatchGradeNm", cwatchGradeNm);
		model.addAttribute("tno", tno);
		model.addAttribute("tname", tname);
		model.addAttribute("dateDay", dateDay);
		model.addAttribute("sday", sday);
		model.addAttribute("sstartTime", sstartTime);
		model.addAttribute("sno", sno);
		model.addAttribute("shallno", shallno);
		model.addAttribute("shallType", shallType);
		model.addAttribute("shallLocation", shallLocation);
		model.addAttribute("sendTime", sendTime);
		
		int selectShallSeatAll = ticketSVC.selectShallSeatAll(sno);
		model.addAttribute("selectShallSeatAll", selectShallSeatAll);
		
		int selectShallSeatUseing = ticketSVC.selectShallSeatUseing(sno);
		model.addAttribute("selectShallSeatUseing", selectShallSeatUseing);
		
		ScreenSeatVO useingSeat = new ScreenSeatVO(cno, sstartTime, sno);
		List<ScreenSeatVO> selectUseingSeat = ticketSVC.selectUseingSeat(useingSeat);
		model.addAttribute("useingSeat", selectUseingSeat);
		
		ScreenSeatVO ticketInfo = new ScreenSeatVO(cno, tno, sday, sstartTime, shallno, sno);
		List<ScreenSeatVO> selectScreenSeat = ticketSVC.selectScreenSeat(ticketInfo);
		model.addAttribute("screenSeat", selectScreenSeat);
		
		UserVO loginVO = (UserVO) authentication.getPrincipal();
		int mno = loginVO.getMno();
		
		model.addAttribute("mno", mno);
		
		httpSession.setAttribute("mno", mno);
		
		
		return "ticket/ticketSeat";
	}
	
	@RequestMapping(value="/reservationCheck", method=RequestMethod.POST)
	@ResponseBody
	public List<ScreenSeatVO> reservationCheck(String cnoParam, String sstartTimeParam, String snoParam) {
		
		int cno = (Integer.parseInt(cnoParam));
		int sno = (Integer.parseInt(snoParam));
		String sstartTime = sstartTimeParam;
		
		ScreenSeatVO useingSeat = new ScreenSeatVO(cno, sstartTime, sno);
		List<ScreenSeatVO> selectUseingSeat = ticketSVC.selectUseingSeat(useingSeat);
		
		return selectUseingSeat;
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String movieView(Model model, HttpServletRequest request) {
		
		int mno = (Integer.parseInt(request.getParameter("mno")));
		int cno = (Integer.parseInt(request.getParameter("cno")));
		String cposter = request.getParameter("cposter");
		String cname = request.getParameter("cname");
		String cwatchGradeNm = request.getParameter("cwatchGradeNm");
		int tno = (Integer.parseInt(request.getParameter("tno")));
		String tname = request.getParameter("tname");
		String sday = request.getParameter("sday");
		String sstartTime = request.getParameter("sstartTime");
		int sno = (Integer.parseInt(request.getParameter("sno")));
		int shallno = (Integer.parseInt(request.getParameter("shallno")));
		String shallType = request.getParameter("shallType");
		String shallLocation = request.getParameter("shallLocation");
		int personNum = (Integer.parseInt(request.getParameter("personNum")));
		String[] seatNosArray = request.getParameterValues("sseatNos");
		Object seats = request.getParameter("seats");
		
		model.addAttribute("mno", mno);
		model.addAttribute("cno", cno);
		model.addAttribute("cposter", cposter);
		model.addAttribute("cname", cname);
		model.addAttribute("cwatchGradeNm", cwatchGradeNm);
		model.addAttribute("tno", tno);
		model.addAttribute("tname", tname);
		model.addAttribute("sday", sday);
		model.addAttribute("sstartTime", sstartTime);
		model.addAttribute("sno", sno);
		model.addAttribute("shallno", shallno);
		model.addAttribute("shallType", shallType);
		model.addAttribute("shallLocation", shallLocation);
		model.addAttribute("personNum", personNum);
		model.addAttribute("seatNosArray", seatNosArray);
		model.addAttribute("seats", seats);
		
		System.out.println("회원번호: "+mno);
		System.out.println("영화번호: "+cno);
		System.out.println("영화포스터: "+cposter);
		System.out.println("영화이름: "+cname);
		System.out.println("관람등급: "+cwatchGradeNm);
		System.out.println("극장번호: "+tno);
		System.out.println("극장이름: "+tname);
		System.out.println("상영관날짜: "+sday);
		System.out.println("상영시작시간: "+sstartTime);
		System.out.println("상영관테이블번호: "+sno);
		System.out.println("상영관번호: "+shallno);
		System.out.println("상영관타입: "+shallType);
		System.out.println("상영관 위치: "+shallLocation);
		System.out.println("인원: "+personNum+"명");
		System.out.println("좌석번호: "+seatNosArray);
		System.out.println("좌석: "+seats);
		
		System.out.println(seatNosArray[0]);
		
		if (seatNosArray != null && seatNosArray.length > 0) {
			String[] noArray = seatNosArray[0].split(",");
			ticketSVC.insertTicket(mno);
			int ticketno = ticketSVC.lastId();
			
			
			for(String sseatno : noArray) {	
				
				TicketDetailVO paramMap = new TicketDetailVO((Integer.parseInt(sseatno)), mno, sno);
				paramMap .setTicketno(ticketno);
				
				int result = ticketSVC.reserveTicket(paramMap);
				
				if( result < 1) {
					System.out.println("좌석 정보가 잘못된 정보입니다.");
				}
			}
		}else {
			System.out.println("선택된 좌석이 없습니다.");
		}
		
		
		
		return "ticket/payment";
	}

}
