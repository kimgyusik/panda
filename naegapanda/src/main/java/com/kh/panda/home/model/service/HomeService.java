package com.kh.panda.home.model.service;

import java.util.ArrayList;

import com.kh.panda.product.model.vo.Product;

public interface HomeService {

	ArrayList<Product> selectHotTopList();
	
}
