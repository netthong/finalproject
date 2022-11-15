package com.project.dragonball.service.roomPhoto;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.roomPhoto.dao.RoomPhotoDAO;
import com.project.dragonball.model.roomPhoto.dto.RoomPhotoDTO;

@Service
public class RoomPhotoServiceImpl implements RoomPhotoService {
	
	@Inject
	RoomPhotoDAO roomPhotoDao;
	
	@Override
	public List<RoomPhotoDTO> photoList(int building_code) {
		return roomPhotoDao.photoList(building_code);
	}

	@Override
	public RoomPhotoDTO photoOneList(int building_code, String room_name) {
		return roomPhotoDao.photoOneList(building_code, room_name);
	}

}
