package com.project.dragonball.service.receipt;

import java.text.ParseException;
import java.util.List;

import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface ReceiptService {
	public List<ReceiptDTO> reservationList(String userid);
	
	void insertReceipt(ReceiptDTO dto) throws ParseException ;
	
	public List<ReceiptDTO> reservationAll();	
	
	public void cancleReservation(int receipt_no);

}
