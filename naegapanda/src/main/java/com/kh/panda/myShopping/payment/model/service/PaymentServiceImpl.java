package com.kh.panda.myShopping.payment.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.payment.model.dao.PaymentDao;
import com.kh.panda.myShopping.payment.model.vo.Payment;

@Service("paService")
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDao paDao;
	
	@Override
	public ArrayList<Payment> myPaymentList(int mNo) {
		return paDao.myPaymentList(mNo);
	}

	@Override
	public int addPayment(Payment p) {
		// 장바구니 삭제
		return paDao.addPayment(p);
	}

	@Override
	public int fixPayment(int payId) {
		return paDao.fixPayment(payId);
	}

}
