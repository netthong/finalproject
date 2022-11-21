package com.project.dragonball.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.dragonball.model.owner.dto.OwnerListDTO;
import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;
import com.project.dragonball.service.owner.OwnerListService;
import com.project.dragonball.service.receipt.ReceiptService;
import com.project.dragonball.service.roomdetail.RoomDetailService;
import com.project.dragonball.service.roominfo.RoomInfoService;
import com.project.dragonball.service.roomreview.RoomReviewService;
import com.project.dragonball.service.user.UserListService;

@Controller
@RequestMapping("owner/*")
public class OwnerController {
	
	
	@Inject
	OwnerListService ownerListService;
	
	@Inject
	RoomDetailService roomDetailService;
	
	@Inject
	RoomInfoService roomInfoService;
	
	@Inject
	RoomReviewService roomReviewService;
	
	@Inject
	UserListService userService;
	
	@Inject
	ReceiptService receiptService;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			/* @RequestParam(defaultValue = "name") String search_option, */
			HttpSession session, ModelAndView mav, OwnerListDTO dto) throws Exception{
		
		Map<String,Object> map=new HashMap<>();
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		
		//포워딩할 뷰
		mav.setViewName("/owner/building_list");
		//전달 할 데이터
		mav.addObject("list", ownerListService.listBuilding());
		
		List<OwnerListDTO> list=ownerListService.listBuilding();		
		
		map.put("list", list); 
		map.put("count", list.size());
		mav.setViewName("/owner/building_list");
		mav.addObject("map", map); //전달 할 데이터
	 

		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute OwnerListDTO dto) {
		System.out.println(dto + ": 디티오");		
		
		String filename="-";
		//첨부 파일이 있으면
		/* dto.getFile1() != null */
		/* (!dto.getFile1().isEmpty() */
		if(dto.getFile1() != null) {
			//첨부 파일의 이름
			filename=dto.getFile1().getOriginalFilename();
			try {
				//배포디렉토리
				// 디렉토리 구분자 : 윈도우즈는 \, 유닉스(리눅스)는 /
				// " "안에 \를 쓰면 특수문자로 알아듣기 때문에 \를 하나 더 써야 인식가능하다.
				String path="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\finalproject\\resources\\images\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장 된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}//end if
		
		dto.setPicture_url(filename);

		ownerListService.insertBuilding(dto); //F4
		return "redirect:/owner/list.do";
	}
	
	
	
	@RequestMapping("write.do")
	public String write() {
		return "owner/owner_write";
	}
	
	@RequestMapping("detail/{building_code}")
	public ModelAndView detail(@PathVariable int building_code, ModelAndView mav) {
		//포워딩
		mav.setViewName("/owner/building_detail");
		//데이터
		mav.addObject("dto", ownerListService.detailBuilding(building_code));
		return mav;
	}
	
	
	
	@RequestMapping("edit/{building_code}")
	public ModelAndView edit(@PathVariable("building_code") int building_code, ModelAndView mav) {
		mav.setViewName("owner/building_edit"); // 뷰
		mav.addObject("dto", ownerListService.detailBuilding(building_code));// 전달 할 데이터
		return mav;
	}
	
	
	
	@RequestMapping("update.do")
	public String update(OwnerListDTO dto) {
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
			OwnerListDTO dto2=ownerListService.detailBuilding(dto.getBuilding_code());
			dto.setPicture_url(dto2.getPicture_url());
		}
		//상품정보 수정
		ownerListService.updateBuilding(dto); //F4
		return "redirect:/owner/list.do";
	}
	
	//상품 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int building_code) {
		//첨부 파일 삭제
		String filename=ownerListService.fileInfo1(building_code); //F4
		System.out.println("첨부파일 이름 : "+filename);
		if(filename != null && !filename.equals("-")) { //파일이 있으면
			String path="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
					+ "\\tmp0\\wtpwebapps\\finalproject\\resources\\images\\";
			File f=new File(path+filename);
			System.out.println("파일존재여부 : "+f.exists());
			if(f.exists()) { //파일이 존재하면
				f.delete(); //파일 목록 삭제
				System.out.println("삭제 되었습니다.");
			}			
		}
		//레코드 삭제
		ownerListService.deleteBuilding(building_code);
		//화면 이동
		return "redirect:/owner/list.do";
		
	}
	
	@RequestMapping("review.do")
	public ModelAndView review(ModelAndView mav) {
		
		/*
		 * double roomAvgPoint = roomReviewService.roomAvgPoint(building_code); //업소에
		 * 해당되는 모든 평점의 평균을 계산 System.out.println("평균평점 : " + roomAvgPoint);
		 * mav.addObject("roomAvgPoint", roomAvgPoint);
		 */
		
		/*
		 * List<RoomReviewDTO> roomreview =
		 * roomReviewService.roomReviewListDesc(building_code); //업소에 해당하는 모든 리뷰를 가져옴
		 * mav.addObject("review", roomreview);
		 * 
		 * List<RoomReviewDTO> newRoomReview =
		 * roomReviewService.newRoomReviewList(building_code); //업소에 해당하는 최근 리뷰 3개를 가져옴
		 * mav.addObject("newReview", newRoomReview);
		 */
		
		
		List<RoomReviewDTO> list = roomReviewService.listReview();
		
		mav.addObject("list", list);
		mav.setViewName("owner/review_management");
		
		return mav;
		
	}
	
	@RequestMapping("review/delete.do")
	public String deleteReview(@RequestParam("REPLYNO") int REPLYNO) {				
		
		
				
				roomReviewService.deleteRoomReview(REPLYNO);
				//화면 이동
				return "redirect:/owner/review.do";
	}
	
	@RequestMapping("reser_list.do")
	public ModelAndView reservationList(ModelAndView mav) {
		
		
		mav.addObject("list", receiptService.reservationAll());
		mav.setViewName("reservation/reservation_list");
		return mav;
	}
	
	@RequestMapping("reser_cancle.do")
	public String cancleReser(@RequestParam("receipt_no") int receipt_no) {
	
		
	receiptService.cancleReservation(receipt_no);
	
	return "redirect:/owner/reser_list.do";
	
	}
	
	
	
	
}