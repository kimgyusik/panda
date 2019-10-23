package com.kh.panda.admin.board.qna.seller.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.board.qna.seller.model.vo.SAnswer;
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
		
		return (ArrayList)sqlSession.selectList("sqnaMapper.selectList", null, rowBounds);
	}
	
	public int insertSQna(SQna q) {
		return sqlSession.insert("sqnaMapper.insertSQna", q);
	}
	
	public int updateCount(int sqId) {
		return sqlSession.update("sqnaMapper.updateCount", sqId);
	}
	
	public SQna sqnaDetail(int sqId) {
		return sqlSession.selectOne("sqnaMapper.selectSQna", sqId);
	}
	
	public int updateSQna(SQna q) {
		return sqlSession.update("sqnaMapper.updateSQna", q);
	}
	
	public int deleteSQna(int sqId) {
		return sqlSession.delete("sqnaMapper.deleteSQna", sqId);
	}
	
	public int insertSAnswer(SAnswer a) {
		return sqlSession.insert("sqnaMapper.insertSAnswer", a);
	}
	
	public ArrayList<SAnswer> selectSAList(){
		return (ArrayList)sqlSession.selectList("sqnaMapper.selectSAList");
	}
	
	public SAnswer sanswerDetail(int sqId) {
		return sqlSession.selectOne("sqnaMapper.selectSAnswer", sqId);
	}
	
	public int deleteSAnswer(int sqId) {
		return sqlSession.delete("sqnaMapper.deleteSAnswer", sqId);
	}
}
