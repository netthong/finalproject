package com.project.dragonball.service.pay;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.pay.dao.PayDAO;
import com.project.dragonball.model.pay.dto.PayDTO;

@Service
public class PayServiceImpl implements PayService {
	
	@Inject
	PayDAO payDao;

	@Override
	public List<PayDTO> listPay() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPay(PayDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<PayDTO> listRoom(int ROOM_NO) {
		return payDao.listRoom(ROOM_NO);
	}

}
