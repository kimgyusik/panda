package com.kh.panda.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {
	
	@RequestMapping("sJoin.do")
	public String InsertSeller() {
		
		return "seller/sellerJoinForm";
	
	}

}
