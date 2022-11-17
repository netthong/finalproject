package com.project.dragonball.controller.pay;


import java.util.Date;
import java.util.List;

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
import com.project.dragonball.model.owner.dto.OwnerListDTO;
import com.project.dragonball.model.pay.dto.PayDTO;
import com.project.dragonball.model.receipt.dto.ReceiptDTO;
import com.project.dragonball.model.room.dto.RoomDTO;
import com.project.dragonball.model.roominfo.dto.RoomListDTO;
import com.project.dragonball.service.pay.PayService;
import com.project.dragonball.service.receipt.ReceiptService;
import com.project.dragonball.service.room.RoomService;
import com.project.dragonball.service.roomdetail.RoomDetailService;
import com.project.dragonball.service.roominfo.RoomInfoService;

@Controller
@RequestMapping("pay/*")
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Inject
	PayService payService;
	
	@Inject
	RoomService roomService;
	
	@RequestMapping("pay.do")
	@ResponseBody
	public ModelAndView pay(HttpSession session,
							  @RequestParam("startdate") String startdate, @RequestParam("enddate") String
							  enddate, @RequestParam("section") String section,
							 ModelAndView mav, @RequestParam("ROOM_NO") int ROOM_NO) {	
		
		/*
		 * long startdate2 = startdate.getTime(); long enddate2 = enddate.getTime(); int
		 * dupli = (int)(enddate2 - startdate2) / (1000*60*60*24);
		 */
		String userid = (String)session.getAttribute("userid");
		
		Date date = new Date(Long.parseLong(startdate));
		Date date2 = new Date(Long.parseLong(enddate));
			
		
		RoomDTO dto = roomService.detailRoom(ROOM_NO);		
		 mav.addObject("userid", userid);
		 mav.addObject("startdate", date);
		 mav.addObject("enddate", date2);
		 mav.addObject("section", Integer.parseInt(section));
		 
		
		mav.addObject("rooml", dto);			
		mav.setViewName("/pay/pay_detail");
		
		return mav;
		
	}
	
	@RequestMapping("complete.do")
	public ModelAndView complete(ModelAndView mav) {
		
		
		mav.setViewName("/room/room_detail");
		return mav;
		
	}

}
