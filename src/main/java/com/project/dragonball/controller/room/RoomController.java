package com.project.dragonball.controller.room;

import java.io.File;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.model.room.dto.RoomDTO;
import com.project.dragonball.service.room.RoomService;

@Controller
@RequestMapping("room/*")
public class RoomController {
	
	@Inject
	RoomService roomService;
	
	@RequestMapping("list.do")
	@ResponseBody
	public ModelAndView list(HttpSession session, ModelAndView mav, @RequestParam("building_code") int building_code) {
		
		List<RoomDTO> list=roomService.listRoom(building_code);
		System.out.println("building_code : " + building_code);
		mav.setViewName("/room/room_list");
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
		
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(ModelAndView mav, @RequestParam("building_code") int building_code) {
		
		
		mav.addObject("building_code", building_code);
		mav.setViewName("/room/room_write");
		return mav;
	}
	
	@RequestMapping("insert.do")
	@ResponseBody
	public ModelAndView insert(@ModelAttribute RoomDTO dto, ModelAndView mav) {
		
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\finalproject\\resources\\images\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		dto.setPicture_url(filename);
		roomService.insertRoom(dto); //F4
		
		List<RoomDTO> list=roomService.listRoom(dto.getBuilding_code());
		mav.setViewName("/room/room_list");
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}
	
	@RequestMapping("detail/{room_no}")
	public ModelAndView detail(@PathVariable int room_no, ModelAndView mav) {
		//포워딩
		mav.setViewName("/room/room_detail");
		//데이터
		mav.addObject("dto", roomService.detailRoom(room_no));
		return mav;
	}
	
	@RequestMapping("edit/{room_no}")
	public ModelAndView edit(@PathVariable("room_no") int room_no, ModelAndView mav) {
		mav.setViewName("room/room_edit"); // 뷰
		mav.addObject("dto", roomService.detailRoom(room_no));// 전달 할 데이터
		return mav;
	}
	
	
	@RequestMapping("update.do")
	public String update(@RequestParam int building_code, RoomDTO dto, @RequestParam("room_no") int room_no ) {
		String filename="-";
		//첨부 파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				
				String path="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core" 
						+ "\\tmp0\\wtpwebapps\\finalproject\\resources\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPicture_url(filename);
		}else { //새로운 첨부 파일이 없을 때
			//기존에 첨부한 파일 정보를 가져오기
			RoomDTO dto2=roomService.detailRoom(dto.getRoom_no());
			dto.setPicture_url(dto2.getPicture_url());
		}
		//상품정보 수정
		roomService.updateRoom(dto); //F4
		return "redirect:/room/list.do?building_code=" + building_code;
	}
	
	//상품 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int building_code, @RequestParam int room_no) {
		//첨부 파일 삭제
		String filename=roomService.fileInfo(room_no); //F4
		System.out.println("첨부파일 이름 : "+filename);
		if(filename != null && !filename.equals("-")) {
			String path="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
					+ "\\tmp0\\wtpwebapps\\spring02\\resources\\images\\";
			File f=new File(path+filename);
			System.out.println("파일존재여부 : "+f.exists());
			if(f.exists()) { //파일이 존재하면
				f.delete(); //파일 목록 삭제
				System.out.println("삭제 되었습니다.");
			}			
		}
		//레코드 삭제
		roomService.deleteRoom(room_no);
		//화면 이동
		return "redirect:/room/list.do?building_code=" + building_code;
		
	}
	
	
	
	
}
