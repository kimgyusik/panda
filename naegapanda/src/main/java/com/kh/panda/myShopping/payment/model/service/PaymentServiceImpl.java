package com.kh.panda.myShopping.payment.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.panda.myShopping.basket.model.dao.BasketDao;
import com.kh.panda.myShopping.basket.model.vo.Basket;
import com.kh.panda.myShopping.payment.model.dao.PaymentDao;
import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.product.model.dao.ProductDao;

@Service("paService")
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDao paDao;
	@Autowired
	private BasketDao baDao;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProductDao pDao;
	
	@Override
	public ArrayList<Payment> myPaymentList(int mNo) {
		return paDao.myPaymentList(mNo);
	}

	@Override
	public int addPayment(Payment p) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			sqlSession.getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 현재 내 장바구니 가져옴
		ArrayList<Basket> list = baDao.selectbasketList(p.getmNo());
		
		int count = 0;
		
		Payment addP = new Payment();
		
		// 장바구니에 담긴 각 상품을 결제 태이블에 등록하고 장바구니에서는 삭제하는 로직
		for(Basket b : list) {
			
			addP = p; // input으로 받은 결재정보 복사
			
			addP.setoNo(b.getoNo());
			addP.setCount(b.getAmount());
			addP.setPrice(b.getAmount() * b.getPrice());
			
			int result = paDao.addPayment(addP);
			int result2 = baDao.deleteBasket(b);
			
			pDao.increaseOpurchase(addP);
			pDao.increasePpurchase(addP);
			
			if(result == 0 || result2 == 0) {
				transactionManager.rollback(status);
				return 0;
			}else {
				count++;
			}
		}
		transactionManager.commit(status);
		return count;
	}

	@Override
	public int fixPayment(int payId) {
		return paDao.fixPayment(payId);
	}

}
