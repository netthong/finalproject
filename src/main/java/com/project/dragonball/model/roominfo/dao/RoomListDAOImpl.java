package com.project.dragonball.model.roominfo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.roominfo.dto.RoomListDTO;

@Repository
public class RoomListDAOImpl implements RoomListDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<RoomListDTO> roomInfoList(int building_code) {
		System.out.println("방의 상세정보를 가져온다.");
		return sqlSession.selectList("roomlist.list", building_code);
	}

	@Override
	public RoomListDTO replyinfo(int building_code, String room_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("building_code", building_code);
		map.put("room_name", room_name);
		return sqlSession.selectOne("roomlist.replylist", map);
	}
	
	@Override
	public Integer roomMinPrice(int building_code) {
		return sqlSession.selectOne("roomlist.roomMinPrice", building_code);
	}

}
