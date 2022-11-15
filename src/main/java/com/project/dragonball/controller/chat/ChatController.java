package com.project.dragonball.controller.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chat/*")
public class ChatController {
	
	@RequestMapping("play.do")
	public String play() {
		return "owner/chat";
	}
	
	

}
