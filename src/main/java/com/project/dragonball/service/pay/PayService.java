package com.project.dragonball.service.pay;

import java.util.List;

import com.project.dragonball.model.pay.dto.PayDTO;
import com.project.dragonball.model.receipt.dto.ReceiptDTO;

public interface PayService {
	public List<PayDTO> listPay();
	public void insertPay(PayDTO dto);
	public List<PayDTO> listRoom(int ROOM_NO);

}
