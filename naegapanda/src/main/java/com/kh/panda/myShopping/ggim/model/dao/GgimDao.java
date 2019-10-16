package com.kh.panda.myShopping.ggim.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Repository("ggDao")
public class GgimDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(int mNo) {
		return sqlSession.selectOne("ggimMapper.getListCount", mNo);
	}
	
	public ArrayList<Ggim> selectGgimList(PageInfo pi, int mNo){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ggimMapper.selectList", mNo, rowBounds);
	}
	
	public ArrayList<Ggim> selectGgimList(int mNo){

		return (ArrayList)sqlSession.selectList("ggimMapper.selectGgimList", mNo);
	}
	
	public int addGgim(Ggim ggim) {
		return sqlSession.insert("ggimMapper.addGgim", ggim);
	}
	
	public int deleteGgim(Ggim ggim) {
		return sqlSession.delete("ggimMapper.deleteGgim", ggim);
	}

}
