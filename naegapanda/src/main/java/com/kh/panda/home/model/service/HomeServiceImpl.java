package com.kh.panda.home.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.home.model.dao.HomeDao;
import com.kh.panda.product.model.vo.Product;

@Service("hService")
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao hDao;

	@Override
	public ArrayList<Product> selectHotTopList() {
		return hDao.selectHotTopList();
	}
	
}
