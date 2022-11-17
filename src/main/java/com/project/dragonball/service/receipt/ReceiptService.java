package com.project.dragonball.service.receipt;

import java.util.List;

import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface ReceiptService {
	public List<ReceiptDTO> reservationList(String userid);
	
	

}
