package com.kh.panda.admin.board.qna.user.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.board.qna.user.model.vo.Answer;
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
	
	public int updateCount(int uqId) {
		return sqlSession.update("qnaMapper.updateCount", uqId);
	}
	
	public Qna qnaDetail(int uqId) {
		return sqlSession.selectOne("qnaMapper.selectQna", uqId);
	}
	
	public int updateQna(Qna q) {
		return sqlSession.update("qnaMapper.updateQna", q);
	}
	
	public int deleteQna(int uqId) {
		return sqlSession.delete("qnaMapper.deleteQna", uqId);
	}
	
	public int insertAnswer(Answer a) {
		return sqlSession.insert("qnaMapper.insertAnswer", a);
	}
	
	public ArrayList<Answer> selectAList(){
		return (ArrayList)sqlSession.selectList("qnaMapper.selectAList");
	}
	
	public Answer answerDetail(int uqId) {
		return sqlSession.selectOne("qnaMapper.selectAnswer", uqId);
	}
	
	public int deleteAnswer(int uqId) {
		return sqlSession.delete("qnaMapper.deleteAnswer", uqId);
	}
}
