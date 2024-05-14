package ezen.dteam.service;

import java.util.List;
import ezen.dteam.vo.CinemaVO;
import ezen.dteam.vo.ScreenHallVO;
import ezen.dteam.vo.ScreenSeatVO;
import ezen.dteam.vo.ScreenVO;
import ezen.dteam.vo.TheaterVO;
import ezen.dteam.vo.TicketDetailVO;

public interface TicketSVC {
	
	List<TheaterVO> selectTheater();
	
	List<CinemaVO> selectMovie();
	
	List<CinemaVO> selectMovieCode(String movieCode);
	
	List<ScreenHallVO> selectScreenHall(int tno);

	List<ScreenVO> selectScreen(ScreenVO screenVO);

	List<ScreenSeatVO> selectScreenSeat(ScreenSeatVO ticketInfo);

	List<TicketDetailVO> selectCheckSeat(TicketDetailVO ticketDetailVO);

	int insertTicket(int mno);
	
	int reserveTicket(TicketDetailVO paramMap);

	int lastId();

	int selectShallSeatAll(int sno);
	
	int selectShallSeatUseing(int sno);

	List<ScreenSeatVO> selectUseingSeat(ScreenSeatVO useingSeat);
}
