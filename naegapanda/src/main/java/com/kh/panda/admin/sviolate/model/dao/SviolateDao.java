package com.kh.panda.admin.sviolate.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.common.PageInfo;

@Repository("svDao")
public class SviolateDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int getListCount() {
		return sqlSession.selectOne("sviolateMapper.getListCount");
	}
	
	public ArrayList<Sviolate> selectSviolateList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("sviolateMapper.selectList", null, rowBounds);
	}
	
	public int getSviolateListCount() {
		return sqlSession.selectOne("sviolateMapper.getSviolateListCount");
	}
	
	
}
