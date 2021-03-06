package com.kh.panda.admin.board.notice.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.board.notice.model.vo.Notice;
import com.kh.panda.common.PageInfo;

public interface NoticeService {
	
	// 전체조회, 게시판등록, 상세조회, 게시판 수정, 게시판 삭제
	
	// 공지사항 전체 리스트 조회
	// 1_1. 공지사항 총 갯수 조회
	int getListCount();
	// 1_2. 공지사항 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 2. 공지 작성
	int insertNotice(Notice n);
	
	// 3. 공지 상세 조회
	Notice noticeDetail(int nId);

	// 4. 공지 조회
	Notice selectNotice(int nId);
	
	// 5. 공지 삭제
	int deleteNotice(int nId);
	
	// 6. 공지 수정
	int updateNotice(Notice n);
}
