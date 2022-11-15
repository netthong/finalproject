package com.project.dragonball.service.roomPhoto;

import java.util.List;

import com.project.dragonball.model.roomPhoto.dto.RoomPhotoDTO;

public interface RoomPhotoService {
	public List<RoomPhotoDTO> photoList(int building_code); //업소에 해당하는 방들의 사진을 모두 가져옴
	
	public RoomPhotoDTO photoOneList(int building_code, String room_name); //업소의 방 타입 하나의 사진을 모두 가져옴
}
