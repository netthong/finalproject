package com.project.dragonball.model.receipt.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.receipt.dto.ReceiptDTO;

@Repository
public class ReceiptDAOImpl implements ReceiptDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReceiptDTO> reservationList(String userid) {
		return sqlSession.selectList("receipt.reservationList", userid);
	}

}
