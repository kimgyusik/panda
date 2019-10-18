package com.kh.panda.myShopping.payment.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.basket.model.dao.BasketDao;
import com.kh.panda.myShopping.basket.model.vo.Basket;
import com.kh.panda.myShopping.payment.model.dao.PaymentDao;
import com.kh.panda.myShopping.payment.model.vo.Payment;

@Service("paService")
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDao paDao;
	@Autowired
	private BasketDao baDao;
	
	@Override
	public ArrayList<Payment> myPaymentList(int mNo) {
		return paDao.myPaymentList(mNo);
	}

	@Override
	public int addPayment(Payment p) {

		// 현재 내 장바구니 가져옴
		ArrayList<Basket> list = baDao.selectbasketList(p.getmNo());
		
		int count = 0;
		
		// 장바구니에 담긴 각 상품을 결제 태이블에 등록하고 장바구니에서는 삭제하는 로직
		for(Basket b : list) {
			
			Payment addP = p; // input으로 받은 결재정보 복사
			addP.setpId(b.getpId());
			addP.setCount(b.getAmount());
			
			int result = paDao.addPayment(addP);
			int result2 = baDao.deleteBasket(b);
			
			if(result == 0 || result2 == 0) {
				return 0;
			}else {
				count++;
			}
		}
		
		return count;
	}

	@Override
	public int fixPayment(int payId) {
		return paDao.fixPayment(payId);
	}

}
