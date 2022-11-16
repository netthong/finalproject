package com.project.dragonball.service.room;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.room.dao.RoomDAO;
import com.project.dragonball.model.room.dto.RoomDTO;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Inject
	RoomDAO roomDao;

	

	@Override
	public String fileInfo(int room_no) {
		return roomDao.fileInfo(room_no);
	}

	@Override
	public List<RoomDTO> listRoom(int building_code) {
		return roomDao.listRoom(building_code);
	}

	@Override
	public RoomDTO detailRoom(int room_no) {
		return roomDao.detailRoom(room_no);
	}

	@Override
	public void updateRoom(RoomDTO dto) {
		roomDao.updateRoom(dto);
		
	}

	@Override
	public void deleteRoom(int room_no) {
		roomDao.deleteRoom(room_no);
		
	}

	@Override
	public void insertRoom(RoomDTO dto) {
		roomDao.insertRoom(dto);
		
	}

}
