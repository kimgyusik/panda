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
	ArrayList<Product> Hot1List();
	ArrayList<Product> Hot2List();
	ArrayList<Product> Hot3List();
	ArrayList<Product> Hot4List();
	ArrayList<Product> Hot5List();
	ArrayList<Product> Hot6List();
	
	
	
	ArrayList<Product> Newest();
	ArrayList<Product> NewTopList(int category);
	ArrayList<Product> New1List();
	ArrayList<Product> New2List();
	ArrayList<Product> New3List();
	ArrayList<Product> New4List();
	ArrayList<Product> New5List();
	ArrayList<Product> New6List();

}
