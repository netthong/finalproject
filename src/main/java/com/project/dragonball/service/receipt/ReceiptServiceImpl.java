package com.project.dragonball.service.receipt;

import java.text.ParseException;
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
	public void insertReceipt(ReceiptDTO dto) throws ParseException  {
		receiptDao.insertReceipt(dto);
		
	}

	@Override
	public List<ReceiptDTO> reservationAll() {
	      return receiptDao.reservationAll();

	}

	@Override
	public void cancleReservation(int receipt_no) {
	      receiptDao.cancleReservation(receipt_no);
	      
	}
	   
}
