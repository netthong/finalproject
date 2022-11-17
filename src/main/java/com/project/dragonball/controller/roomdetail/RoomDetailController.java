package com.project.dragonball.controller.roomdetail;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.model.owner.dto.OwnerListDTO;
import com.project.dragonball.model.roominfo.dto.RoomListDTO;
import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;
import com.project.dragonball.service.roomPhoto.RoomPhotoService;
import com.project.dragonball.service.roomdetail.RoomDetailService;
import com.project.dragonball.service.roominfo.RoomInfoService;
import com.project.dragonball.service.roomreview.RoomReviewService;

@Controller
@RequestMapping("roomdetail/*")
public class RoomDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomDetailController.class);
	
	@Inject
	RoomDetailService roomDetailService;
	
	@Inject
	RoomInfoService roomInfoService;
	
	@Inject
	RoomReviewService roomReviewService;
	
	@Inject
	RoomPhotoService roomPhotoService;
	
	/*
	 * @RequestMapping("list.do") public String list() { return "room/list"; }
	 * 
	 * //방을 클릭했을 때 방의 상세정보로 이동
	 * 
	 * @RequestMapping("roomDetail/view/{building_code}")
	 */
	
	@RequestMapping("view/{building_code}")
	public ModelAndView view(@PathVariable int building_code, ModelAndView mav) {
		logger.info("view 컨트롤러 진입");
				
		OwnerListDTO dto = new OwnerListDTO();
		dto = roomDetailService.roomDetailList(building_code);//업소(OWNER_LIST)의 상세 정보를 가져옴
		mav.addObject("detail", dto);
		
		List<RoomListDTO> list = roomInfoService.roomInfoList(building_code);//가져온 업소에 해당하는 방의 정보(ROOM_LIST)를가져옴
		mav.addObject("roomInfo", list);
		
		String roomAcco = dto.getAccomodation();
		String[] roomAcco1 = roomAcco.split(",");//업소의 편의기능(ACCOMODATION)을 ,이 있는 구간마다 나누어 배열로 변경
		logger.info(roomAcco);
		mav.addObject("roomAcco", roomAcco1);
		
		
		double roomAvgPoint = roomReviewService.roomAvgPoint(building_code); //업소에 해당되는 모든 평점의 평균을 계산
		System.out.println("평균평점 : " + roomAvgPoint);
		mav.addObject("roomAvgPoint", roomAvgPoint);
		
		Map<String, String> avgPointStar = new HashMap<>();
		if (roomAvgPoint > 0 && roomAvgPoint <= 5) { 
			for (int i = 1; i <= 5; i++) { 
				if (i - 0.3 >= roomAvgPoint && i - 0.7 <= roomAvgPoint) { //0.0~0.2사이 빈별, 0.3~0.7까지 반별, 0.8~0.9는 채운별.
					avgPointStar.put("star" + i, "bi-star-half");//반별
				} else if ( i - 0.2 <= roomAvgPoint) {
					avgPointStar.put("star" + i, "bi-star-fill");//채운별
				} else {
					avgPointStar.put("star" + i, "bi-star");//빈별
				}
			}
		} else {
			for (int i = 1; i <= 5; i++) {
				avgPointStar.put("star" + i, "");
			}
		}
		//i-1+0.7, i-1+0.3, i-1+0.8
		
		mav.addObject("avgPointStar", avgPointStar);
		
		List<RoomReviewDTO> roomreview = roomReviewService.roomReviewListDesc(building_code); //업소에 해당하는 모든 리뷰를 가져옴
		mav.addObject("review", roomreview);
		
		List<RoomReviewDTO> newRoomReview = roomReviewService.newRoomReviewList(building_code); //업소에 해당하는 최근 리뷰 3개를 가져옴
		mav.addObject("newReview", newRoomReview);
		
		mav.setViewName("roomdetail/roomdetail");
		//OWNER_LIST : dto
		//ROOM_LIST : list
		//ACCOMODATION : roomAcco1
		
		return mav;
	}
	
}
