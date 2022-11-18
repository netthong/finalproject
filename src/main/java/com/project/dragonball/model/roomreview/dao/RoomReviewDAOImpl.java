package com.project.dragonball.model.roomreview.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.roomreview.dto.RoomReviewDTO;

@Repository
public class RoomReviewDAOImpl implements RoomReviewDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<RoomReviewDTO> reviewList(int building_code) {
		return sqlSession.selectList("review.reviewList", building_code);
	}

	@Override
	public List<RoomReviewDTO> reviewListDesc(int num) {
		return sqlSession.selectList("review.reviewListDesc", num);
	}

	@Override
	public void reviewInsert(RoomReviewDTO dto) {
		sqlSession.insert("review.reviewInsert", dto);
	}

	@Override
	public void reviewReply(RoomReviewDTO dto) {
		sqlSession.insert("review.reviewReply", dto);
	}

	@Override
	public List<RoomReviewDTO> newRoomReviewList(int building_code) {
		return sqlSession.selectList("review.threeNew", building_code);
	}

	@Override
	public List<RoomReviewDTO> listReview() {
		return sqlSession.selectList("review.just_list");
	}

	@Override
	public void deleteRoomReview(int building_code) {
		sqlSession.delete("review.delete", building_code);
		
	}
	
}
