package com.project.dragonball.model.receipt.dao;

import java.util.List;


import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface ReceiptDAO {


	void insertReceipt(String userid);

	public List<ReceiptDTO> reservationList(String userid);

	public void reviewUpdate(int receipt_NO);


}
