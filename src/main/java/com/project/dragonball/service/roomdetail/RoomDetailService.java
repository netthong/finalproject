package com.project.dragonball.service.roomdetail;

import java.util.List;

import com.project.dragonball.model.owner.dto.OwnerListDTO;

public interface RoomDetailService {

	public OwnerListDTO roomDetailList(int building_code); //업소 상세보기 리스트

	public List<OwnerListDTO> roomInfo(String buildingName); //업소 하나의 방의 정보를 확인

	public List<OwnerListDTO> getAllType(); //모든 타입을 가져옴

	public List<OwnerListDTO> getAllBuilding(String type); //타입에 해당되는 모든 업소를 가져옴

	public List<OwnerListDTO> getAllBuilding(String type1, String type2); //호텔, 리조트에 해당되는 모든 업소를 가져옴

	public List<OwnerListDTO> getAllBuildingKeyword(String type, String keyword); //타입에 해당되며, 주소를 포함하는 업소를 가져옴

	public List<OwnerListDTO> getAllBuildingKeyword(String type1, String type2, String keyword); //호텔, 리조트이며 주소를 포함하는 업소를 가져옴

	
}
