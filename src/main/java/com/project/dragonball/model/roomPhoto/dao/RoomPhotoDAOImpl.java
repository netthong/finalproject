package com.project.dragonball.model.roomPhoto.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.roomPhoto.dto.RoomPhotoDTO;

@Repository
public class RoomPhotoDAOImpl implements RoomPhotoDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<RoomPhotoDTO> photoList(int building_code) {
		return sqlSession.selectList("roomPhoto.roomPhotoList", building_code);
	}

	@Override
	public RoomPhotoDTO photoOneList(int building_code, String room_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("building_code", building_code);
		map.put("room_name", room_name);
		
		return sqlSession.selectOne("roomPhoto.roomPhotoOneList", map);
	}

}
