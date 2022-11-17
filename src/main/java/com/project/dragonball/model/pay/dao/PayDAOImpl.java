package com.project.dragonball.model.pay.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.pay.dto.PayDTO;


@Repository
public class PayDAOImpl implements PayDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<PayDTO> listPay() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPay(PayDTO dto) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public List<PayDTO> listRoom(int ROOM_NO) {
		System.out.println("방 정보 가져오기333");
		return sqlSession.selectList("pay.roomlist", ROOM_NO);
	}

}
