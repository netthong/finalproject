package com.project.dragonball.controller.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("pay/*")
public class PayController {
	
	@RequestMapping("pay.do")
	public String pay() {
		return "pay/pay_detail";
	}

}
