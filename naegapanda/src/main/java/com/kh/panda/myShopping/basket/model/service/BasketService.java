package com.kh.panda.myShopping.basket.model.service;

import java.util.ArrayList;

import com.kh.panda.myShopping.basket.model.vo.Basket;

public interface BasketService {
	
	// 내 장바구니
	ArrayList<Basket> selectbasketList(int mNo);
	
	// 장바구니에 추가
	int addBasket(Basket b);
	
	// 장바구니에서 제외(단일)
	int deleteBasket(Basket b);
	
	// 장바구니에서 제외(다중)
	int deleteBasketList(int mNo, String[] arr);
	
}
