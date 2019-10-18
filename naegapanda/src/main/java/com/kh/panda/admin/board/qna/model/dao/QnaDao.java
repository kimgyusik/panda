package com.kh.panda.admin.board.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
