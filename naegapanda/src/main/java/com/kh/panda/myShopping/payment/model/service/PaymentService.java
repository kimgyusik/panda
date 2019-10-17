package com.kh.panda.myShopping.payment.model.service;

import java.util.ArrayList;

import com.kh.panda.myShopping.payment.model.vo.Payment;

public interface PaymentService {
	
	// 내 결재 리스트 조회
	ArrayList<Payment> myPaymentList(int mNo);
	
	// 결재 추가 처리
	int addPayment(Payment p);
	
	// 구매확정 처리
	int fixPayment(int payId);

}
