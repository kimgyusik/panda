package com.kh.panda.myShopping.basket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.myShopping.basket.model.vo.Basket;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Repository("baDao")
public class BasketDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Basket> selectbasketList(int mNo){
		return (ArrayList)sqlSession.selectList("basketMapper.selectbasketList", mNo);
	}
	
	public int selectbasket(Basket b){
		return sqlSession.selectOne("basketMapper.selectbasket", b);
	}
	
	public int selectoNo(int pId){
		return sqlSession.selectOne("basketMapper.selectoNo",pId);
	}
	
	public int addBasket(Basket b) {
		return sqlSession.insert("basketMapper.addBasket", b);
	}
	
	public int addBasket2(Basket b) {
		return sqlSession.insert("basketMapper.addBasket2", b);
	}
	
	public int deleteBasket(Basket b) {
		return sqlSession.delete("basketMapper.deleteBasket", b);
	}
	
	public int updateAmount(Basket b) {
		return sqlSession.update("basketMapper.updateAmount", b);
	}

}
