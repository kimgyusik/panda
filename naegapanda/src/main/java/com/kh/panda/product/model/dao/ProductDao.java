package com.kh.panda.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.product.model.vo.CategoryNumber;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.SearchCondition;

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
		int num3 = category;
		
		switch(category) {
		case 1000:
			num1=1; num2=58;
			break;
		case 1001:
			num1=1; num2=9;
			break;
		case 1002:
			num1=10; num2=19;
			break;
		case 1003:
			num1=20; num2=28;
			break;
		case 1004:
			num1=29; num2=39;
			break;
		case 1005:
			num1=40; num2=49;
			break;
		case 1006:
			num1=50; num2=58;
			break;
		default:
			num1= num3; num2=num3;
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
		int num3 = category;
		
		switch(category) {
		case 1000:
			num1=1; num2=58;
			break;
		case 1001:
			num1=1; num2=9;
			break;
		case 1002:
			num1=10; num2=19;
			break;
		case 1003:
			num1=20; num2=28;
			break;
		case 1004:
			num1=29; num2=39;
			break;
		case 1005:
			num1=40; num2=49;
			break;
		case 1006:
			num1=50; num2=58;
			break;
		default:
			num1= num3; num2=num3;
			break;
		}
		
		CategoryNumber cn = new CategoryNumber(num1, num2);
		
		return sqlSession.selectOne("productMapper.listCount", cn);
		
		
	}
	
	
	
	public int getListCount(String keyword,int category) {
		int num1 = 0;
		int num2 = 0;
		
		switch(category) {
		case 1000:
			num1=1; num2=58;
			break;
		case 1001:
			num1=1; num2=9;
			break;
		case 1002:
			num1=10; num2=19;
			break;
		case 1003:
			num1=20; num2=28;
			break;
		case 1004:
			num1=29; num2=39;
			break;
		case 1005:
			num1=40; num2=49;
			break;
		case 1006:
			num1=50; num2=58;
			break;
		}
		
		SearchCondition sc = new SearchCondition(keyword,num1,num2);
		
		return sqlSession.selectOne("productMapper.searchListCount", sc);

	}
	
	public ArrayList<Product> search(String keyword, PageInfo pi, int category) {
		int num1 = 0;
		int num2 = 0;
		
		switch(category) {
		case 1000:
			num1=1; num2=58;
			break;
		case 1001:
			num1=1; num2=9;
			break;
		case 1002:
			num1=10; num2=19;
			break;
		case 1003:
			num1=20; num2=28;
			break;
		case 1004:
			num1=29; num2=39;
			break;
		case 1005:
			num1=40; num2=49;
			break;
		case 1006:
			num1=50; num2=58;
			break;
		default:
			num1=category; num2=category;
			break;
		}
		
		SearchCondition sc = new SearchCondition(keyword,num1,num2);
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.search", sc, rowBounds);
	}
	
	
	
	
	public ArrayList<Product> HotTopList(int category){
		int num1 = 0;
		int num2 = 0;
		int num3 = category;
		
		switch(category) {
		case 1000:
			num1=1; num2=58;
			break;
		case 1001:
			num1=1; num2=9;
			break;
		case 1002:
			num1=10; num2=19;
			break;
		case 1003:
			num1=20; num2=28;
			break;
		case 1004:
			num1=29; num2=39;
			break;
		case 1005:
			num1=40; num2=49;
			break;
		case 1006:
			num1=50; num2=58;
			break;
		default:
			num1= num3; num2=num3;
			break;
		}
		
		CategoryNumber cn = new CategoryNumber(num1, num2);
		return (ArrayList)sqlSession.selectList("productMapper.HotTopList", cn);
	}
	public ArrayList<Product> NewTopList(int category){
		int num1 = 0;
		int num2 = 0;
		int num3 = category;
		
		switch(category) {
		case 1000:
			num1=1; num2=58;
			break;
		case 1001:
			num1=1; num2=9;
			break;
		case 1002:
			num1=10; num2=19;
			break;
		case 1003:
			num1=20; num2=28;
			break;
		case 1004:
			num1=29; num2=39;
			break;
		case 1005:
			num1=40; num2=49;
			break;
		case 1006:
			num1=50; num2=58;
			break;
		default:
			num1= num3; num2=num3;
			break;
		}
		
		CategoryNumber cn = new CategoryNumber(num1, num2);
		return (ArrayList)sqlSession.selectList("productMapper.NewTopList", cn);
	}
	public ArrayList<Product> Newest(){
		return (ArrayList)sqlSession.selectList("productMapper.Newest");
	}

	public int oCount(int pId) {
		return sqlSession.selectOne("productMapper.oCount", pId);
	}

	public int deleteProduct(int pId) {
		return sqlSession.update("productMapper.deleteProduct", pId);
	}
	
	public int increasePpurchase(Payment p) {
		return sqlSession.update("productMapper.increasePpurchase", p);
	}
	
	public int increaseOpurchase(Payment p) {
		return sqlSession.update("productMapper.increaseOpurchase", p);
	}
	
	public ArrayList<Product> NewList(CategoryNumber cn){
		return (ArrayList)sqlSession.selectList("productMapper.NewList",cn);
	}
	public ArrayList<Product> HotList(CategoryNumber cn){
		return (ArrayList)sqlSession.selectList("productMapper.HotList",cn);
	}
	
	
}
