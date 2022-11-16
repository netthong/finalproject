package com.project.dragonball.model.receipt.dao;

import java.util.List;

import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface ReceiptDAO {

	List<ReceiptDTO> reservationList(String userid);

}
