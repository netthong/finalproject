package com.project.dragonball.model.roomreview.dao;

import java.util.List;

import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;

public interface RoomReviewDAO {
	public List<RoomReviewDTO> reviewList(int building_code); //해당 업소에 해당되는 리뷰글을 모두 가저옴.

	public List<RoomReviewDTO> reviewListDesc(int num); //해당 업소에 해당되는 리뷰글을 최신순으로 가져옴.

	public void reviewInsert(RoomReviewDTO dto); //리뷰를 등록함

	public void reviewReply(RoomReviewDTO dto); //리뷰의 답글을 등록함

	public List<RoomReviewDTO> newRoomReviewList(int building_code); //해당 업소에 해당되는 최신 리뷰글 3개를 가져옴.

	public Integer roomPointCount(int building_code); //업소의 평점 갯수를 가져옴
	
	public List<RoomReviewDTO> listReview(); //목록 보기
	
	public void deleteRoomReview(int replyno);
	
	
	
	
}
