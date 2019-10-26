package com.kh.panda.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.product.model.dao.ProductDao;
import com.kh.panda.product.model.vo.Product;

@Service("pService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao pDao; 

	@Override
	public int increasepCount(int pId) {
		return pDao.increasepCount(pId);
	}

}
