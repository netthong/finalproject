package com.project.dragonball.service.receipt;

import java.util.List;

import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface ReceiptService {
	List<ReceiptDTO> reservationList(String userid);
	List<ReceiptDTO> listRoom(int ROOM_NO);

}
