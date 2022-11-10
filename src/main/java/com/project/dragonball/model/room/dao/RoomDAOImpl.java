package com.project.dragonball.model.room.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.room.dto.RoomDTO;

@Repository
public class RoomDAOImpl implements RoomDAO {
	
	@Inject
	SqlSession sqlSession;

	

	@Override
	public String fileInfo(int room_no) {
		return sqlSession.selectOne("room.fileInfo", room_no);
	}

	@Override
	public List<RoomDTO> listRoom(String building_name) {
		return sqlSession.selectList("room.room_list", building_name);
	}

	@Override
	public RoomDTO detailRoom(int room_no) {
		return sqlSession.selectOne("room.detail_room", room_no);
	}

	@Override
	public void updateRoom(RoomDTO dto) {
		sqlSession.update("room.update", dto);
		
	}

	@Override
	public void deleteRoom(int room_no) {
		sqlSession.delete("room.delete", room_no);
		
	}

	@Override
	public void insertRoom(RoomDTO dto) {
		sqlSession.insert("room.insert", dto);
		
	}

}
