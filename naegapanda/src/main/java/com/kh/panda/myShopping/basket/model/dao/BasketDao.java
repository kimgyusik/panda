package com.kh.panda.myShopping.basket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.myShopping.basket.model.vo.Basket;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Repository("bDao")
public class BasketDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Basket> selectbasketList(int mNo){
		return (ArrayList)sqlSession.selectList("basketMapper.selectbasketList", mNo);
	}
	
	public int addBasket(Basket b) {
		return sqlSession.insert("basketMapper.addBasket", b);
	}
	
	public int deleteBasket(Basket b) {
		return sqlSession.delete("basketMapper.deleteBasket", b);
	}

}
