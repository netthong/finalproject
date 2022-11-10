package com.project.dragonball.model.owner.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.owner.dto.OwnerListDTO;

@Repository
public class OwnerListDAOImpl implements OwnerListDAO {
	
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

}
