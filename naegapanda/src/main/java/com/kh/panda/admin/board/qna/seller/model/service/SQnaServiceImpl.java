package com.kh.panda.admin.board.qna.seller.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.seller.model.dao.SQnaDao;
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
}
