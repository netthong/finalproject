package com.project.dragonball.service.roomreview;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.roomreview.dao.RoomReviewDAO;
import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;

@Service
public class RoomReviewServiceImpl implements RoomReviewService {
	
	@Inject
	RoomReviewDAO roomReviewDao;
	
	@Override
	public double roomAvgPoint(int building_code) {
		int total = 0;
		int nullcount = 0;
		List<RoomReviewDTO> point = roomReviewDao.reviewList(building_code);
		
		for (int i=0; i<point.size(); i++) {
			System.out.println(i + "번째 평점 : " + point.get(i).getPOINT());
			total += point.get(i).getPOINT(); //총 점수를 구함
			if (point.get(i).getPOINT() == 0) {
				nullcount += 1; //그 값이 0이라면 값이 없는 것의 개수를 1씩 더함.
			}
		}
		
		double avgpoint = total/(point.size()-nullcount);
		
		System.out.println("total : " + total);
		System.out.println("nullcount : " + nullcount);
		System.out.println("avgpoint : " + avgpoint);
		
		return Math.round(avgpoint*10)/10.0;
	}

	@Override
	public List<RoomReviewDTO> roomReviewList(int building_code) {
		return roomReviewDao.reviewList(building_code);
	}

	@Override
	public List<RoomReviewDTO> roomReviewListDesc(int num) {
		return roomReviewDao.reviewListDesc(num);
	}

	@Override
	public void reviewInsert(RoomReviewDTO dto) {
		roomReviewDao.reviewInsert(dto);
	}

	@Override
	public void reviewReply(RoomReviewDTO dto) {
		roomReviewDao.reviewReply(dto);
	}

	@Override
	public List<RoomReviewDTO> newRoomReviewList(int building_code) {
		return roomReviewDao.newRoomReviewList(building_code);
	}
	
}
