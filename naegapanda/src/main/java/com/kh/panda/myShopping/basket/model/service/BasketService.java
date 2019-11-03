package com.kh.panda.myShopping.basket.model.service;

import java.util.ArrayList;

import com.kh.panda.myShopping.basket.model.vo.Basket;

public interface BasketService {
	
	// 내 장바구니
	ArrayList<Basket> selectbasketList(int mNo);
	
	// 장바구니에 추가
	int addBasket(Basket b);
	
	// 장바구니에 추가
	int addBasket2(Basket b);
	
	// 장바구니에서 제외(단일)
	int deleteBasket(Basket b);
	
	// 장바구니에서 제외(다중)
	int deleteBasketList(int mNo, String[] arr);
	
	// 상품 개수 수정
	int updateAmount(Basket b);
	
	// 장바구니 갯수,금액(메인메뉴바)
	int[] currentBasket(int mNo);
	
	// oNo으로 상품정보 조회
	Basket selectProductByoNo(int oNo);
	
	
}
