package com.project.dragonball.service.receipt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.receipt.dao.ReceiptDAO;
import com.project.dragonball.model.receipt.dto.ReceiptDTO;

@Service
public class ReceiptServiceImpl implements ReceiptService {
	
	@Inject
	ReceiptDAO receiptDao;

	@Override
	public List<ReceiptDTO> reservationList(String userid) {
		return receiptDao.reservationList(userid);
	}

	@Override
	public void insertReceipt(String userid) {
		receiptDao.insertReceipt(userid);
		
	}


}
