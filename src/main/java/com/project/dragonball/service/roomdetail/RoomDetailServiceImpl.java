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

	@Override
	public List<OwnerListDTO> getAllType() {
		return ownerListDao.getAllType();
	}

	@Override
	public List<OwnerListDTO> getAllBuilding(String type) {
		return ownerListDao.getAllBuilding(type);
	}

	@Override
	public List<OwnerListDTO> getAllBuilding(String type1, String type2) {
		return ownerListDao.getAllBuilding(type1, type2);
	}

	@Override
	public List<OwnerListDTO> getAllBuildingKeyword(String type, String keyword) {
		return ownerListDao.getAllBuildingKeyword(type, keyword);
	}

	@Override
	public List<OwnerListDTO> getAllBuildingKeyword(String type1, String type2, String keyword) {
		return ownerListDao.getAllBuildingKeyword(type1, type2, keyword);
	}
	
	@Override
	public List<OwnerListDTO> getAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OwnerListDTO> getAllListDis() {
		return ownerListDao.getAllListDis();
	}

	@Override
	public List<OwnerListDTO> getAllBuildingHighPoint(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OwnerListDTO> getAllBuildingLowPrice(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OwnerListDTO> getAllBuildingHighPrice(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}
