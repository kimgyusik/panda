package com.kh.panda.admin.violate.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.model.vo.PageInfo;

@Repository("vDao")
public class ViolateDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("violteMapper.getListCount");
	}
	
	public ArrayList<Violate> selectList(PageInfo pi){
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("violateMapper.selectList", null, rowBounds);
	}
	
}
