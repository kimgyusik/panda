package com.kh.panda.admin.board.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.model.dao.QnaDao;

@Service("qService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qDao;
	
	
}
