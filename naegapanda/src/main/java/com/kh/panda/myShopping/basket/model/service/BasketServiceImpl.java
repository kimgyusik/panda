package com.kh.panda.myShopping.basket.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.basket.model.dao.BasketDao;
import com.kh.panda.myShopping.basket.model.vo.Basket;

@Service("bService")
public class BasketServiceImpl implements BasketService{
	
	@Autowired
	private BasketDao bDao;

	@Override
	public ArrayList<Basket> selectbasketList(int mNo) {
		return bDao.selectbasketList(mNo);
	}

	@Override
	public int addBasket(Basket b) {
		return bDao.addBasket(b);
	}

	@Override
	public int deleteBasket(Basket b) {
		return bDao.deleteBasket(b);
	}

	@Override
	public int deleteBasketList(int mNo, String[] arr) {
		
		int result = 1;
		
		for(int i=0; i<arr.length; i++) {
			
			Basket b = new Basket();
			b.setmNo(mNo);
			b.setpId(Integer.parseInt(arr[i]));
			
			result = bDao.deleteBasket(b);
			
			if(result == 0) {
				return result;
			}
		}
		
		return result;
	}

}
