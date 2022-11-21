package com.project.dragonball.service.roomreview;

import java.util.List;

import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;

public interface RoomReviewService {

	public double roomAvgPoint(int building_code);//업소에 해당하는 모든 평점의 평균을 소숫점 첫째자리까지 반올림함

	public List<RoomReviewDTO> roomReviewList(int building_code); //업소에 해당하는 모든 리뷰를 가져옴

	public List<RoomReviewDTO> roomReviewListDesc(int num); //업소에 해당하는 모든 리뷰를 최신순으로 가져옴

	public void reviewInsert(RoomReviewDTO dto); //리뷰를 등록함

	public void reviewReply(RoomReviewDTO dto); //리뷰의 답글을 등록함

	public List<RoomReviewDTO> newRoomReviewList(int building_code); //업소에 해당하는 최신 리뷰 3개를 가져옴
	
	public List<RoomReviewDTO> listReview();
	
	public void deleteRoomReview(int replyno);
	
	public Integer roomPointCount(int building_code); //업소에 해당하는 모든 평점의 갯수를 구함

	
	
}
