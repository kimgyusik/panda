package com.kh.panda.admin.board.qna.user.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.board.qna.user.model.vo.Qna;
import com.kh.panda.common.PageInfo;

@Repository("qDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}
	
	public ArrayList<Qna> selectList(PageInfo pi){
		
		// offset = 몇개의 게시글을 건너띄고 조회할 건지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList", null, rowBounds);
	}
	
	public int insertQna(Qna q) {
		return sqlSession.insert("qnaMapper.insertQna", q);
	}
	
}
