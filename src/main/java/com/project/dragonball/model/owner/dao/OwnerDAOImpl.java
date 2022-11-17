package com.project.dragonball.model.owner.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.owner.dto.OwnerListDTO;

@Repository
public class OwnerDAOImpl implements OwnerListDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<OwnerListDTO> listBuilding() {
		return sqlSession.selectList("owner.building_list");
	}

	@Override
	public OwnerListDTO detailBuilding(int building_code) {
		return sqlSession.selectOne("owner.detail_building", building_code);
	}

	@Override
	public void updateBuilding(OwnerListDTO dto) {
		sqlSession.update("owner.update_building", dto);

	}

	@Override
	public void deleteBuilding(int building_code) {
		sqlSession.delete("owner.building_delete", building_code);

	}

	@Override
	public void insertBuilding(OwnerListDTO dto) {
		sqlSession.insert("owner.insert", dto);

	}

	@Override
	public String fileInfo1(int building_code) {
		return sqlSession.selectOne("owner.fileInfo1", building_code);
	}

	@Override
	public OwnerListDTO roomDetailList(int building_code) {
		System.out.println("방의 상세정보를 가져온다.");
		return sqlSession.selectOne("ownerList.view", building_code);
	}

	@Override
	public List<OwnerListDTO> roomInfo(String buildingName) {
		return sqlSession.selectList("roomList.list", buildingName);
	}

	@Override

	public List<OwnerListDTO> admissionBuilding() {
		return sqlSession.selectList("owner.admissionBuilding");
	}

	@Override
	public void permission(int building_code) {
		sqlSession.update("owner.permission", building_code);
	}

	public List<OwnerListDTO> getAllType() {
		return sqlSession.selectList("ownerList.getAllType");
	}

	@Override
	public List<OwnerListDTO> getAllBuilding(String type) {
		return sqlSession.selectList("ownerList.getBuilding", type);
	}

	@Override
	public List<OwnerListDTO> getAllBuilding(String type1, String type2) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type1", type1);
		map.put("type2", type2);
		return sqlSession.selectList("ownerList.getBuildingtwo", map);
	}

	@Override
	public List<OwnerListDTO> getAllBuildingKeyword(String type, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		return sqlSession.selectList("ownerList.getBuildingkeyword", map);
	}

	@Override
	public List<OwnerListDTO> getAllBuildingKeyword(String type1, String type2, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("keyword", keyword);
		return sqlSession.selectList("ownerList.getBuildingtwoKeyword", map);
	}
	
	@Override
	public List<OwnerListDTO> getAllListDis() {
		return sqlSession.selectList("ownerList.getAllListDis");
	}

}
