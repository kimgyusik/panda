package com.kh.panda.myShopping.basket.model.service;

import java.util.ArrayList;

import com.kh.panda.myShopping.basket.model.vo.Basket;

public interface BasketService {
	
	ArrayList<Basket> selectList(int mNo);
	
	int addBasket(Basket b);
	
	int deleteBasket(Basket b);
	
	int deleteBasketList(int mNo, String[] arr);
}
