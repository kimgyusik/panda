package com.kh.panda.product.model.service;

import java.util.ArrayList;

import com.kh.panda.common.PageInfo;
import com.kh.panda.product.model.vo.Product;

public interface ProductService {

	int increasepCount(int pId);

	int deleteOption(int oNo);

	ArrayList<Product> search(String keyword);

	ArrayList<Product> selectpList(PageInfo pi, int category);

	int getListCount(int category);

}
