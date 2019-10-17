package com.kh.panda.seller.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.kh.panda.seller.model.dao.SellerDao;
import com.kh.panda.seller.model.vo.Seller;


@Service("sService")
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sDao;

	@Override
	public int insertSeller(Seller s) {
		
		return sDao.insertSeller(s);
	}

	@Override
	public Seller loginSeller(Seller s) {
		
		return sDao.loginSeller(s);
	}

	@Override
	public int idCheck(String sId) {
		return sDao.idCheck(sId);
	}

}
