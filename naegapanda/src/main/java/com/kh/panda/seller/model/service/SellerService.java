package com.kh.panda.seller.model.service;

import com.kh.panda.seller.model.vo.Seller;

public interface SellerService {
	
	// 1. 판매자 회원가입 
	int insertSeller(Seller s);

	// 2. 판매자 로그인
	Seller loginSeller(Seller s);
	
	// 3. 아이디 중복체크
	int sIdCheck(String sId);

	String findsId(String sEmail);

	int updateSeller(Seller s);

}
