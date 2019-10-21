package com.kh.panda.admin.board.qna.seller.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.board.qna.seller.model.vo.SQna;
import com.kh.panda.common.PageInfo;

@Repository("sqDao")
public class SQnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("sqnaMapper.getListCount");
	}
	
	public ArrayList<SQna> selectList(PageInfo pi){
		
		// offset = 몇개의 게시글을 건너띄고 조회할 건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("sqnaMapper.selectList", null, rowBounds );
	}

}
