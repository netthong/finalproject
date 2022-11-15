package com.project.dragonball.model.roomdetail.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.roomdetail.dto.OwnerListDTO;

@Repository
public class OwnerListDAOImpl implements OwnerListDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public OwnerListDTO roomDetailList(int building_code) {
		System.out.println("방의 상세정보를 가져온다.");
		return sqlSession.selectOne("ownerList.view", building_code);
	}

	@Override
	public List<OwnerListDTO> roomInfo(String buildingName) {
		return sqlSession.selectList("roomList.list", buildingName);
	}

}
