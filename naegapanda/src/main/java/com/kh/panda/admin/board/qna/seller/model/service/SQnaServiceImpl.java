package com.kh.panda.admin.board.qna.seller.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.seller.model.dao.SQnaDao;
import com.kh.panda.admin.board.qna.seller.model.vo.SAnswer;
import com.kh.panda.admin.board.qna.seller.model.vo.SQna;
import com.kh.panda.common.PageInfo;

@Service("sqService")
public class SQnaServiceImpl implements SQnaService {

	@Autowired
	private SQnaDao sqDao;
	
	@Override
	public int getListCount() {
		return sqDao.getListCount();
	}

	@Override
	public ArrayList<SQna> selectList(PageInfo pi) {
		return sqDao.selectList(pi);
	}

	@Override
	public int insertSQna(SQna q) {
		return sqDao.insertSQna(q);
	}

	@Override
	public SQna sqnaDetail(int sqId) {
		
		// 1. 조회수 증가
		int result = sqDao.updateCount(sqId);
		
		// 2. 상세조회
		if(result>0) {
			return sqDao.sqnaDetail(sqId);
		}else {
			return null;
		}
	}

	@Override
	public int updateSQna(SQna q) {
		return sqDao.updateSQna(q);
	}

	@Override
	public int deleteSQna(int sqId) {
		return sqDao.deleteSQna(sqId);
	}

	@Override
	public int insertSAnswer(SAnswer a) {
		return sqDao.insertSAnswer(a);
	}

	@Override
	public ArrayList<SAnswer> selectSAList() {
		return sqDao.selectSAList();
	}

	@Override
	public SAnswer sanswerDetail(int sqId) {
		return sqDao.sanswerDetail(sqId);
	}

	@Override
	public int deleteSAnswer(int sqId) {
		return sqDao.deleteSAnswer(sqId);
	}

	
}
