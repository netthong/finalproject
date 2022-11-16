package com.project.dragonball.controller.roominfo;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.project.dragonball.controller.roomdetail.RoomDetailController;
import com.project.dragonball.model.roominfo.dto.RoomListDTO;
import com.project.dragonball.service.roomdetail.RoomDetailService;
import com.project.dragonball.service.roominfo.RoomInfoService;
import com.project.dragonball.service.roomreview.RoomReviewService;

@Controller
@RequestMapping("roominfo/*")
public class RoomInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Inject
	RoomDetailService roomDetailService;
	
	@Inject
	RoomInfoService roomInfoService;
	
	@Inject
	RoomReviewService roomReviewService;
	
	@RequestMapping("infolist.do")
	public List<RoomListDTO> getAttach(int capacity, HttpSession session) {
		logger.info("infolist.do 실행");
		logger.info("building_code의 값 : " + session.getAttribute("code"));
		logger.info("sdate의 값 : " + session.getAttribute("startDate"));
		logger.info("edate의 값 : " + session.getAttribute("endDate"));
		logger.info("capacity의 값 : " + capacity);
		return roomInfoService.roomInfoList(Integer.parseInt((String)session.getAttribute("code")));
	}
}
