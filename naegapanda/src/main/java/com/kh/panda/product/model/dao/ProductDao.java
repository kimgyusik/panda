package com.kh.panda.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.product.model.vo.Product;

@Repository("pDao")
public class ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int increasepCount(int pId) {
		return sqlSession.update("productMapper.updatepCount", pId);
	}

	public int deleteOption(int oNo) {
		return sqlSession.update("productMapper.deleteOption", oNo);
	}

}
