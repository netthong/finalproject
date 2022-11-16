package com.project.dragonball.model.pay.dao;

import java.util.List;


import com.project.dragonball.model.pay.dto.PayDTO;



public interface PayDAO {
	public List<PayDTO> listPay();
	public void insertPay(PayDTO dto);

}
