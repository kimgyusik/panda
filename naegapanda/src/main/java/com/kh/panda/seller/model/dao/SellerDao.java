package com.kh.panda.seller.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.common.PageInfo;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.ProductOption;
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


	public int sIdCheck(String sId) {
		return sqlSession.selectOne("sellerMapper.sIdCheck", sId);
	}


	public String findsId(String sEmail) {
		return sqlSession.selectOne("sellerMapper.findsId", sEmail);
	}


	public int updateSeller(Seller s) {
		return sqlSession.update("sellerMapper.updateSeller", s);
	}


	public int getListCount(int sNo) {
		int listCount = 0;
		listCount = sqlSession.selectOne("sellerMapper.getListCount", sNo);
		return listCount;
	}


	public ArrayList<ProductOption> selectList(PageInfo pi, int sNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", sNo, rowBounds);
	}
	
	
	
	public int deleteSeller(Seller s) {
		return sqlSession.update("sellerMapper.deleteSeller", s);
	}


	public ArrayList<Category> selectcList() {
		return (ArrayList)sqlSession.selectList("productMapper.selectcList");
	}

}
