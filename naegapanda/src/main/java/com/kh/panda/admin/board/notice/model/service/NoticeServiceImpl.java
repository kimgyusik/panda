package com.kh.panda.admin.board.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.notice.model.dao.NoticeDao;
import com.kh.panda.admin.board.notice.model.vo.Notice;
import com.kh.panda.common.PageInfo;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao nDao;

	@Override
	public int getListCount() {
		return nDao.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(n);
	}

	@Override
	public Notice noticeDetail(int nId) {

		// 1. 조회수 증가
		int result = nDao.updateCount(nId);
		
		// 2. 상세조회
		if(result > 0) {
			return nDao.noticeDetail(nId);
		}else {
			return null;
		}
	}

	@Override
	public Notice selectNotice(int nId) {
		return nDao.noticeDetail(nId);
	}

	@Override
	public int deleteNotice(int nId) {
		return nDao.deleteNotice(nId);
	}
	
	
	
}
