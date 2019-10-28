package com.kh.panda.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.common.PageInfo;
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

	@Override
	public int deleteOption(int oNo) {
		return pDao.deleteOption(oNo);
	}

	@Override
	public ArrayList<Product> search(String keyword, PageInfo pi, int category) {
		return pDao.search(keyword, pi, category);
	}

	@Override
	public int getListCount(int category) {
		return pDao.getListCount(category);
	}

	@Override
	public ArrayList<Product> selectpList(PageInfo pi, int category) {
		return pDao.selectpList(pi, category);
	}

	@Override
	public int getListCount(String keyword, int category) {
		return pDao.getListCount(keyword,category);
	}

}
