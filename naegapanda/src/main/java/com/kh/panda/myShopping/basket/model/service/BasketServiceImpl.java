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
		return baDao.addBasket(b);
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

}
