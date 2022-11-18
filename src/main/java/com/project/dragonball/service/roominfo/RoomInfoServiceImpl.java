package com.project.dragonball.service.roominfo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.roominfo.dao.RoomListDAO;
import com.project.dragonball.model.roominfo.dto.RoomListDTO;

@Service
public class RoomInfoServiceImpl implements RoomInfoService {
	
	@Inject
	RoomListDAO roomListDao;
	
	@Override
	public List<RoomListDTO> roomInfoList(int building_code) {
		return roomListDao.roomInfoList(building_code);
	}

	@Override
	public RoomListDTO replyinfo(int building_code, String room_name) {
		return roomListDao.replyinfo(building_code, room_name);
	}

	@Override
	public Integer roomMinPrice(int building_code) {
		return roomListDao.roomMinPrice(building_code);
	}

}
