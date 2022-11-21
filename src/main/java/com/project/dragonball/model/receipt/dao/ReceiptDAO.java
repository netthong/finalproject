package com.project.dragonball.model.receipt.dao;

import java.text.ParseException;
import java.util.List;


import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface ReceiptDAO {


	void insertReceipt(ReceiptDTO dto ) throws ParseException;

	public List<ReceiptDTO> reservationList(String userid);

	public void reviewUpdate(int receipt_NO);

	public void cancleReservation(int receipt_no);

	public List<ReceiptDTO> reservationAll();
	
	
	
}
