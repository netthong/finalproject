package com.project.dragonball.controller.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("reservation/*")
public class reservation {
	
	@RequestMapping("list.do")
	public String list() {
		return "reservation/reservation_list";
	}

}
