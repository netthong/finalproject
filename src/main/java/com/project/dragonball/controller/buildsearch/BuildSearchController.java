package com.project.dragonball.controller.buildsearch;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dragonball.service.roomdetail.RoomDetailService;

@Controller
@RequestMapping("building/*")
public class BuildSearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuildSearchController.class);
	
	@Inject
	RoomDetailService roomDetailService;
	
	@RequestMapping("search.do")
	public String search(
			@RequestParam(defaultValue = "") String buildingtype,
			@RequestParam(defaultValue = "") String keyword,
			Model model) {
		logger.info("타입 : " + buildingtype);
		model.addAttribute("types", roomDetailService.getAllType()); //모텔, 호텔, 리조트, 펜션, 게스트하우스
		
		if (buildingtype.equals("m")) { //받은 타입이 모텔이라면
			if (keyword.equals("") || keyword == null) { //주소가 없다면
				model.addAttribute("searchlist", roomDetailService.getAllBuilding("motel"));
				model.addAttribute("type", "모텔");
			} else {
				model.addAttribute("searchlist", roomDetailService.getAllBuildingKeyword("motel", keyword));
				model.addAttribute("type", "모텔");
			}
		} else if (buildingtype.equals("h")) { //받은 타입이 호텔,리조트라면
			if (keyword.equals("") || keyword == null) {
				model.addAttribute("searchlist", roomDetailService.getAllBuilding("hotel"));
				model.addAttribute("type", "호텔 리조트");
			} else {
				model.addAttribute("searchlist", roomDetailService.getAllBuildingKeyword("hotel", keyword));
				model.addAttribute("type", "호텔 리조트");
			}
		} else if (buildingtype.equals("p")) { //받은 타입이 펜션이라면
			if (keyword.equals("") || keyword == null) {
				model.addAttribute("searchlist", roomDetailService.getAllBuilding("pension"));
				model.addAttribute("type", "펜션");
			} else {
				model.addAttribute("searchlist", roomDetailService.getAllBuildingKeyword("pension", keyword));
				model.addAttribute("type", "펜션");
			}
		} else if (buildingtype.equals("g")) { //받은 타입에 게스트하우스라면
			if (keyword.equals("") || keyword == null) {
				model.addAttribute("searchlist", roomDetailService.getAllBuilding("guest"));
				model.addAttribute("type", "게스트하우스");
			} else {
				model.addAttribute("searchlist", roomDetailService.getAllBuildingKeyword("guest", keyword));
				model.addAttribute("type", "게스트하우스");
			}
		}
		
		return "roomdetail/roomsearch";
	}
	
	@RequestMapping("search1.do")
	public String search1 (
			@RequestParam(defaultValue = "point") String searchoption,
			Model model) {
		
		
		return "roomdetail/roomsearch";
	}
}
