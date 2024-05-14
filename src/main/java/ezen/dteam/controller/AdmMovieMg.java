package ezen.dteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/admin/movieMg")
@Controller
public class AdmMovieMg {
	
	@RequestMapping(value="/movieMgList", method=RequestMethod.GET)
	public String movieMgList() {
		return "admin/movieMg/movieMgList";
	}
	
	@RequestMapping(value="/movieMgView", method=RequestMethod.GET)
	public String movieMgView() {
		return "admin/movieMg/movieMgView";
	}
	
	@RequestMapping(value="/movieMgAdd", method=RequestMethod.GET)
	public String movieMgAdd() {
		return "admin/movieMg/movieMgAdd";
	}
	@RequestMapping(value="/movieMgAdd", method=RequestMethod.POST)
	public String movieMgAddOk() {
		return "redirect:/";
	}
	
	@RequestMapping(value="/movieMgModify", method=RequestMethod.GET)
	public String movieMgModify() {
		return "admin/movieMg/movieMgModify";
	}
	@RequestMapping(value="/movieMgModify", method=RequestMethod.POST)
	public String movieMgModifyOk() {
		return "redirect:/";
	}
}
