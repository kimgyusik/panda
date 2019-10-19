package com.kh.panda.admin.board.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.model.dao.QnaDao;
import com.kh.panda.admin.board.qna.model.vo.Qna;
import com.kh.panda.common.PageInfo;

@Service("qService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qDao;

	@Override
	public int getListCount() {
		return qDao.getListCount();
	}

	@Override
	public ArrayList<Qna> selectList(PageInfo pi) {
		return qDao.selectList(pi);
	}
	
	
}
