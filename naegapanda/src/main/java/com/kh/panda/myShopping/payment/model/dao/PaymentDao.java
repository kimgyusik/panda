package com.kh.panda.myShopping.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.myShopping.payment.model.vo.Payment;

@Repository("paDao")
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Payment> myPaymentList(int mNo) {
		return (ArrayList)sqlSession.selectList("paymentMapper.myPaymentList", mNo);
	}
	
	public int addPayment(Payment p) {
		return sqlSession.insert("paymentMapper.addPayment", p);
	}
	
	public int fixPayment(int payId) {
		return sqlSession.update("paymentMapper.fixPayment", payId);
	}

}
