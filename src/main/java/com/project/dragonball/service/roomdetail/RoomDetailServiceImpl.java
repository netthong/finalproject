package com.project.dragonball.service.roomdetail;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.owner.dao.OwnerListDAO;
import com.project.dragonball.model.owner.dto.OwnerListDTO;

@Service
public class RoomDetailServiceImpl implements RoomDetailService {
	
	@Inject
	OwnerListDAO ownerListDao;
	
	@Override
	public OwnerListDTO roomDetailList(int building_code) {
		return ownerListDao.roomDetailList(building_code);
	}

	@Override
	public List<OwnerListDTO> roomInfo(String buildingName) {
		return ownerListDao.roomInfo(buildingName);
	}

}
