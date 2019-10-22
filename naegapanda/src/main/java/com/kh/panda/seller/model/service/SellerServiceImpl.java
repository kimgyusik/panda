package com.kh.panda.seller.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.common.PageInfo;
import com.kh.panda.member.model.dao.MemberDao;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.dao.SellerDao;
import com.kh.panda.seller.model.vo.Seller;

@Service("sService")
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sDao;
	
	@Autowired
	private MemberDao mDao;

	@Override
	public int insertSeller(Seller s) {
		
		return sDao.insertSeller(s);
	}

	@Override
	public Seller loginSeller(Seller s) {
		
		return sDao.loginSeller(s);
	}

	@Override
	public int sIdCheck(String sId) {
		return sDao.sIdCheck(sId);
	}

	@Override
	public String findsId(String sEmail) {
		return sDao.findsId(sEmail);
	}

	@Override
	public int updateSeller(Seller s) {
		return sDao.updateSeller(s);
	}

	@Override
	public int getListCount(int sNo) {
		
		return sDao.getListCount(sNo);
	}

	@Override
	public ArrayList<ProductOption> selectList(PageInfo pi, int sNo) {
		return sDao.selectList(pi, sNo);
	public int deleteSeller(Seller s) {
		return sDao.deleteSeller(s);
	}

}
