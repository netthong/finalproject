package com.project.dragonball.controller.admin;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.model.banner.dto.BannerDTO;
import com.project.dragonball.service.Banner.BannerService;
import com.project.dragonball.service.user.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	@Inject
	BannerService bannerService;
	
	@RequestMapping("userList.do")
	@ResponseBody
	public ModelAndView userList(@RequestParam(value = "search_option",required=false) String search_option,
			@RequestParam(value = "keyword",required=false) String keyword, ModelAndView mav) {
		if(search_option == null) search_option = "all";
		if(keyword == null) keyword = "";
		mav.setViewName("/admin/admin_home");
		mav.addObject("list", adminService.userList(search_option,keyword));
		mav.addObject("message", "success");
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		return mav;
	}
	
	@RequestMapping("userStop.do")
	@ResponseBody
	public ModelAndView userStop(@RequestParam("userid") String userid,
			@RequestParam("stop") char stop,ModelAndView mav) {
		adminService.userStop(userid,stop);
		mav.setViewName("/admin/admin_home");
		mav.addObject("message", "search");
		return mav;
	}
	
	@RequestMapping("bannerUp.do")
	public String bannerUp() {
		return "admin/bannerUp";
	}
	
	@RequestMapping("/bannerUpload.do")
	public String bannerUpload(@ModelAttribute BannerDTO dto) throws Exception {
		String filename="-";
		//첨부 파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			//첨부 파일의 이름
			filename=dto.getFile1().getOriginalFilename();
			System.out.println(filename);
			try {
				//배포디렉토리
				// 디렉토리 구분자 : 윈도우즈는 \, 유닉스(리눅스)는 /
				// " "안에 \를 쓰면 특수문자로 알아듣기 때문에 \를 하나 더 써야 인식가능하다.
				
				String path="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core" +
				  "\\tmp0\\wtpwebapps\\finalproject\\resources\\images\\";
				 
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장 된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}//end if
		
		dto.setEvent_mainphoto(filename);
		bannerService.bannerUpload(dto);
		return "redirect:/admin/bannerList.do";	
	}
	
	@RequestMapping("bannerList.do")
	public ModelAndView bannerList(ModelAndView mav) {
		mav.addObject("list", bannerService.bannerList());
		mav.setViewName("/admin/bannerList");
		return mav;
	}
	
	@RequestMapping("bannerDetail.do")
	public ModelAndView bannerDetail(ModelAndView mav, @RequestParam("banner_num") int banner_num) {
		mav.addObject("dto", bannerService.bannerDetail(banner_num));
		mav.setViewName("/admin/bannerDetail");
		return mav;
	}
	
	@RequestMapping("deleteBanner.do")
	public String deleteBanner(@RequestParam("banner_num") int banner_num) {
		bannerService.deleteBanner(banner_num);
		return "redirect:/admin/bannerList.do";
	}
}
