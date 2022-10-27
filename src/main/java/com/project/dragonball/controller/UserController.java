package com.project.dragonball.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.model.user.dto.UserListDTO;
import com.project.dragonball.service.user.UserListService;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	@Inject
	UserListService userService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView loginCheck(UserListDTO dto, HttpSession session) {
		//로그인 성공 true,실패 false
		boolean result=userService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();//성공실패결과값에따라 들어가는 값이 달라서 따로처리
		if(result) {
			mav.setViewName("home");
		} else {//로그인실패
			mav.setViewName("user/login");
			//전달할값
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		userService.logout(session);
		mav.setViewName("user/login");
		mav.addObject("message", "logout");
		return mav;
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping("write.do")
	public String write(@ModelAttribute UserListDTO dto) {
		userService.writeUser(dto);
		return "home";
	}
	
}
