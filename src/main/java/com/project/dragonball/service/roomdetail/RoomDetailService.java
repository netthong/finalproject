package com.project.dragonball.service.roomdetail;

import java.util.List;

import com.project.dragonball.model.owner.dto.OwnerListDTO;

public interface RoomDetailService {

	public OwnerListDTO roomDetailList(int building_code); //업소 상세보기 리스트

	public List<OwnerListDTO> roomInfo(String buildingName); //업소 하나의 방의 정보를 확인

	
}
