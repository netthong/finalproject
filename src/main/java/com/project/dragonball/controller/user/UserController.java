package com.project.dragonball.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		UserListDTO dto2 = userService.viewUser(dto.getUserid());
		if(result) {
			if(dto2.getCategory() == 'c') {
				mav.setViewName("home");				
			}else if(dto2.getCategory() == 'b') {
				mav.setViewName("owner/owner_write");
			}else if(dto2.getCategory() == 'a') {
				mav.setViewName("admin/admin_home");
				mav.addObject("message", "search");
			}
		} else {//로그인실패
			if(dto2.getStop() == 'Y') {
				mav.setViewName("user/login");
				mav.addObject("message", "error");
			}else if(dto2.getStop() == 'N') {
				mav.setViewName("user/login");
				mav.addObject("message", "stop");
			}
			
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
	
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {
		int cnt = userService.idCheck(userid);
		return cnt;
	}
	
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam("name") String name, @RequestParam("email") String email) {
		String data = userService.findId(name,email);
		return data;
	}
	
	@RequestMapping(value = "findPw.do", method = RequestMethod.POST)
	@ResponseBody
	public String findPw(@RequestParam("userid") String userid, @RequestParam("email") String email) {
		String pass = userService.findPw(userid,email);
		String pw = "";
		if(pass != null) {
			for (int i = 0; i < 9; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			userService.updatePass(userid, pw);
		}		
		return pw;
	}
	
	@RequestMapping("userInfo.do")
	public ModelAndView userView(HttpSession session, ModelAndView mav) {
		String userid = (String)session.getAttribute("userid");
		mav.setViewName("user/viewUser");
		mav.addObject("dto", userService.viewUser(userid));
		return mav;
	}
	
	@RequestMapping("changePassword.do")
	public String changePw() {
		return "user/changePassword";
	}
	
	@RequestMapping("changePw.do")
	@ResponseBody
	public ModelAndView changePw(HttpSession session, @RequestParam("pw") String password, 
			@RequestParam("pw1") String nPassword, ModelAndView mav) {
		String userid = (String)session.getAttribute("userid");
		boolean check = userService.checkPw(userid, password);
		if(!check) {
			mav.setViewName("user/changePassword");
			mav.addObject("massage", "error");
		}else {
			userService.updatePass(userid, nPassword);
			mav.setViewName("user/viewUser");
			mav.addObject("dto", userService.viewUser(userid));
			mav.addObject("message", "success");
		}
		return mav;
	}
	
	@RequestMapping("updateName.do")
	@ResponseBody
	public ModelAndView updateName(HttpSession session, @RequestParam("name") String name, ModelAndView mav) {
		String userid = (String)session.getAttribute("userid");
		userService.updateName(userid,name);
		mav.addObject("dto", userService.viewUser(userid));
		mav.setViewName("user/viewUser");
		return mav;
	}
	
	@RequestMapping("updateTel.do")
	@ResponseBody
	public ModelAndView updateTel(HttpSession session, @RequestParam("tel") String tel, ModelAndView mav) {
		String userid = (String)session.getAttribute("userid");
		userService.updateTel(userid,tel);
		mav.addObject("dto", userService.viewUser(userid));
		mav.setViewName("user/viewUser");
		return mav;
	}
	
	@RequestMapping("updateEmail.do")
	@ResponseBody
	public ModelAndView updateEmail(HttpSession session, @RequestParam("email") String email, ModelAndView mav) {
		String userid = (String)session.getAttribute("userid");
		userService.updateEmail(userid,email);
		mav.addObject("dto", userService.viewUser(userid));
		mav.setViewName("user/viewUser");
		return mav;
	}
}
