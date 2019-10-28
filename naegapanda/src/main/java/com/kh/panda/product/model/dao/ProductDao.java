package com.kh.panda.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.common.PageInfo;
import com.kh.panda.product.model.vo.CategoryNumber;
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

	public ArrayList<Product> selectpList(PageInfo pi, int category) {
		int num1 = 0;
		int num2 = 0;
		
		switch(category) {
		case 0:
			num1=1; num2=58;
			break;
		case 1:
			num1=1; num2=9;
			break;
		case 2:
			num1=10; num2=19;
			break;
		case 3:
			num1=20; num2=28;
			break;
		case 4:
			num1=29; num2=39;
			break;
		case 5:
			num1=40; num2=49;
			break;
		case 6:
			num1=50; num2=58;
			break;
		}
		
		CategoryNumber cn = new CategoryNumber(num1, num2);
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectpList", cn, rowBounds);
	}

	public int getListCount(int category) {
		int num1 = 0;
		int num2 = 0;
		
		switch(category) {
		case 0:
			num1=1; num2=58;
			break;
		case 1:
			num1=1; num2=9;
			break;
		case 2:
			num1=10; num2=19;
			break;
		case 3:
			num1=20; num2=28;
			break;
		case 4:
			num1=29; num2=39;
			break;
		case 5:
			num1=40; num2=49;
			break;
		case 6:
			num1=50; num2=58;
			break;
		}
		
		CategoryNumber cn = new CategoryNumber(num1, num2);
		
		return sqlSession.selectOne("productMapper.listCount", cn);
	}

}
