package com.project.dragonball.service.pay;

import java.util.List;

import com.project.dragonball.model.pay.dto.PayDTO;

public interface PayService {
	public List<PayDTO> listPay();
	public void insertPay(PayDTO dto);

}
