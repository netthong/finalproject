package com.project.dragonball.controller.roomreview;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.model.roominfo.dto.RoomListDTO;
import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;
import com.project.dragonball.service.roominfo.RoomInfoService;
import com.project.dragonball.service.roomreview.RoomReviewService;

@Controller
@RequestMapping("reviews/*")
public class RoomReviewController {
	
	@Inject
	RoomReviewService roomReviewService;
	
	@Inject
	RoomInfoService roomInfoService;
	
	@RequestMapping("list.do") //리뷰 리스트들을 최신순으로 가져옴.
	public List<RoomReviewDTO> list(int num) { //num=building_code
		return roomReviewService.roomReviewListDesc(num);
	}
	
	@RequestMapping("insert.do") //리뷰를 등록함
	public String addReview(@ModelAttribute RoomReviewDTO dto, HttpSession session) throws Exception {
		//String writer = (String)session.getAttribute("userid");
		
		String writer = "유저22";
		dto.setUserid(writer);
		
		roomReviewService.reviewInsert(dto);
		
		return "home";
	}
	
	@RequestMapping("reply.do") //답글을 등록함
	public String addReply(@ModelAttribute RoomReviewDTO dto) { //리뷰 답글을 등록함
		roomReviewService.reviewReply(dto);
		
		return "주소";
	}
	
	@RequestMapping("listall/${num}") //해당 업소의 모든 리뷰를 가져옴
	public ModelAndView listall(@PathVariable int num, ModelAndView mav) {
		return mav;
	}
	
	@RequestMapping("write.do") //리뷰를 작성함
	public ModelAndView write(/* @ModelAttribute ReceiptDTO dto, */ModelAndView mav) {
		int building_code = 21;
		String room_name = "트윈";
		RoomListDTO reply = roomInfoService.replyinfo(building_code, room_name);
		mav.addObject("room", reply);
		//mav.addObject("dto", dto);
		mav.setViewName("review/reviewwrite");
		
		return mav;
	}
}
