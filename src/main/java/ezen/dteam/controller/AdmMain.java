package ezen.dteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/admin")
@Controller
public class AdmMain {
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String inquiryList() {
		
		return "redirect:/admin/theaters/theatersMgList";
	}
}
