package com.project.dragonball.service.owner;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.owner.dao.OwnerListDAO;
import com.project.dragonball.model.owner.dto.OwnerListDTO;

@Service
public class OwnerListServiceImpl implements OwnerListService {
	
	@Inject
	OwnerListDAO ownerListDao;

	@Override
	public List<OwnerListDTO> listBuilding() {
		return ownerListDao.listBuilding();
	}

	@Override
	public OwnerListDTO detailBuilding(int building_code) {
		return ownerListDao.detailBuilding(building_code);
	}

	@Override
	public void updateBuilding(OwnerListDTO dto) {
		ownerListDao.updateBuilding(dto);

	}

	@Override
	public void deleteBuilding(int building_code) {
		ownerListDao.deleteBuilding(building_code);

	}

	@Override
	public void insertBuilding(OwnerListDTO dto) {
		ownerListDao.insertBuilding(dto);

	}

	@Override
	public String fileInfo1(int building_code) {
		return ownerListDao.fileInfo1(building_code);
	}

	@Override
	public List<OwnerListDTO> admissionBuilding() {
		return ownerListDao.admissionBuilding();
	}

	@Override
	public void permission(int building_code) {
		ownerListDao.permission(building_code);
	}



}
