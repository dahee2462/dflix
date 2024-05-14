package ezen.dteam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ezen.dteam.scheduler.MovieScheduler;
import ezen.dteam.service.MainSVC;
import ezen.dteam.service.MainSchedulerSVC;
import ezen.dteam.vo.CinemaVO;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Main {

	@Autowired
	MainSVC mainService;
	
	@Autowired
	MainSchedulerSVC mainSchedulerSVC;
	
	@Autowired
	MovieScheduler movieScheduler;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, HttpServletResponse response) throws OpenAPIFault, Exception {
		
		List<CinemaVO> movieChart = mainService.selectBoxOfficeCinema();
		
		model.addAttribute("movieChart", movieChart);
		System.out.println(movieChart);
		
		List<CinemaVO> unopenMovie = mainService.selectUnopen();		
		model.addAttribute("unopenMovie", unopenMovie);
		
		return "index";
	}
	
	@RequestMapping(value = "/scheduler", method = RequestMethod.GET)
	public String test(Model model, HttpServletRequest request, HttpServletResponse response) throws OpenAPIFault, Exception {
		
		movieScheduler.dailyResponse();
		
		movieScheduler.movieList();
		
		return "test";
	}

} 