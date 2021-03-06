package com.kh.panda.home.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.home.model.vo.Home;
import com.kh.panda.product.model.vo.Product;

@Repository("hDao")
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	
	public ArrayList<Product> search(String keyword){
		return (ArrayList)sqlsession.selectList("productMapper.search",keyword);
	}
	
}
