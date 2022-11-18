package com.project.dragonball.model.receipt.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	

	@Override
	public void reviewUpdate(int receipt_NO) {
		sqlSession.update("receipt.reviewUpdate", receipt_NO);
	}



	@Override
	public void insertReceipt(ReceiptDTO dto) throws ParseException {
		Date date = new Date(Long.parseLong(dto.getDate_start()));
		Date date2 = new Date(Long.parseLong(dto.getDate_end()));
        
        
        Map<String, Object> map = new HashMap<>();
        map.put("date", date);
        map.put("date2", date2);
        map.put("dto", dto);
        System.out.println("date : " + date);
        System.out.println("date2 : " + date2);
		sqlSession.insert("receipt.insert", map);
		
		
	}

}
