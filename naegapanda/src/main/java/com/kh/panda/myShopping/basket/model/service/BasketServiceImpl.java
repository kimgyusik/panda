package com.kh.panda.myShopping.basket.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.basket.model.dao.BasketDao;
import com.kh.panda.myShopping.basket.model.vo.Basket;

@Service("baService")
public class BasketServiceImpl implements BasketService{
	
	@Autowired
	private BasketDao baDao;

	@Override
	public ArrayList<Basket> selectbasketList(int mNo) {
		return baDao.selectbasketList(mNo);
	}

	@Override
	public int addBasket(Basket b) {
		
		int count = baDao.selectbasket(b);
		
		if(count > 0) {
			return 2;
		}else {
			return baDao.addBasket(b);
		}
		
	}

	@Override
	public int deleteBasket(Basket b) {
		return baDao.deleteBasket(b);
	}

	@Override
	public int deleteBasketList(int mNo, String[] arr) {
		
		int result = 1;
		
		for(int i=0; i<arr.length; i++) {
			
			Basket b = new Basket();
			b.setmNo(mNo);
			b.setpId(Integer.parseInt(arr[i]));
			
			result = baDao.deleteBasket(b);
			
			if(result == 0) {
				return result;
			}
		}
		
		return result;
	}
	
	@Override
	public int updateAmount(Basket b) {
		return baDao.updateAmount(b);
	}

	@Override
	public int[] currentBasket(int mNo) {

		int[] arr = new int[2];
		arr[0] = 0; // 장바구니 건 수
		arr[1] = 0; // 장바구니 총 금액
		
		ArrayList<Basket> list = selectbasketList(mNo);
		
		arr[0] = list.size(); 
		
		if(list != null) {
			for(Basket b : list) {
				arr[1] += b.getAmount()*b.getPrice(); 
			}
		}
		
		return arr;
	}

}
