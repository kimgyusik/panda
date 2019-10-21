package com.kh.panda.seller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.seller.model.vo.Seller;

@Repository("sDao")
public class SellerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insertSeller(Seller s) {
		
		return sqlSession.insert("sellerMapper.insertSeller", s);
		
	}


	public Seller loginSeller(Seller s) {
		
		return sqlSession.selectOne("sellerMapper.loginSeller", s);
	}


	public int idCheck(String sId) {
		return sqlSession.selectOne("sellerMapper.idCheck", sId);
	}


	public String findsId(String sEmail) {
		return sqlSession.selectOne("sellerMapper.findsId", sEmail);
	}

}
