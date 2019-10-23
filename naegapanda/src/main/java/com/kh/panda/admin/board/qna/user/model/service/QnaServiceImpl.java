package com.kh.panda.admin.board.qna.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.user.model.dao.QnaDao;
import com.kh.panda.admin.board.qna.user.model.vo.Answer;
import com.kh.panda.admin.board.qna.user.model.vo.Qna;
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

	@Override
	public int insertQna(Qna q) {
		return qDao.insertQna(q);
	}

	@Override
	public Qna qnaDetail(int uqId) {
		
		// 1. 조회수 증가
		int result = qDao.updateCount(uqId);
		
		// 2. 상세조회
		if(result>0) {
			return qDao.qnaDetail(uqId);
		}else {
			return null;
		}
	}

	@Override
	public int updateQna(Qna q) {
		return qDao.updateQna(q);
	}

	@Override
	public int deleteQna(int uqId) {
		return qDao.deleteQna(uqId);
	}

	@Override
	public int insertAnswer(Answer a) {
		return qDao.insertAnswer(a);
	}

	@Override
	public ArrayList<Answer> selectAList() {
		return qDao.selectAList();
	}

	@Override
	public Answer answerDetail(int uqId) {
		return qDao.answerDetail(uqId);
	}

	@Override
	public int deleteAnswer(int uqId) {
		return qDao.deleteAnswer(uqId);
	}
	
	
}
