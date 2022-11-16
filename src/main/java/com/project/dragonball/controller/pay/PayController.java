package com.project.dragonball.controller.pay;

import java.util.Date;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.controller.roomdetail.RoomDetailController;
import com.project.dragonball.model.room.dto.RoomDTO;
import com.project.dragonball.service.room.RoomService;
import com.project.dragonball.service.roomdetail.RoomDetailService;
import com.project.dragonball.service.roominfo.RoomInfoService;

@Controller
@RequestMapping("pay/*")
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Inject
	RoomDetailService roomDetailService;
	
	@Inject
	RoomInfoService roomInfoService;
	
	@Inject
	RoomService roomService;
	
	@RequestMapping("pay.do")
	@ResponseBody
	public ModelAndView pay(HttpSession session, ModelAndView mav, @RequestParam ("ROOM_NO") int ROOM_NO) {
		
		
		Date startdate=(Date)session.getAttribute("startdate");
		Date enddate=(Date)session.getAttribute("enddate");
		Date section=(Date)session.getAttribute("section");
		
		mav.addObject("startdate", startdate);
		mav.addObject("enddate", enddate);
		mav.addObject("section", section);
		
		
		
		mav.addObject("list", roomService.listRoom(ROOM_NO));
		mav.setViewName("/pay/pay_detail");
		return mav;
		
	}
	
	@RequestMapping("complete.do")
	public ModelAndView complete(ModelAndView mav) {
		
		
		mav.setViewName("/room/room_detail");
		return mav;
		
	}

}
