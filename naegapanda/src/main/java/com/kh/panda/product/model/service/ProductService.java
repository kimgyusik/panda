package com.kh.panda.product.model.service;

import java.util.ArrayList;

import com.kh.panda.common.PageInfo;
import com.kh.panda.product.model.vo.Product;

public interface ProductService {

	int increasepCount(int pId);

	int deleteOption(int oNo);
	int getListCount(String keyword, int category);
	
	ArrayList<Product> search(String keyword, PageInfo pi, int category);

	ArrayList<Product> selectpList(PageInfo pi, int category);

	int getListCount(int category);
	
	
	
	
	
	ArrayList<Product> HotTopList(int category);
	ArrayList<Product> NewTopList(int category);
	ArrayList<Product> Newest();

}
