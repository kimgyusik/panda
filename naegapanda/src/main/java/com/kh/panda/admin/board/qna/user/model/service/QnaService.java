package com.kh.panda.admin.board.qna.user.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.user.model.vo.Qna;
import com.kh.panda.common.PageInfo;

@Service
public interface QnaService {

	// 1. 회원 서비스 문의 게시판 전체 리스트 조회
	// 1_1. 게시판 총 갯수 조회
	int getListCount();
	// 1_2. 게시판 리스트 조회
	ArrayList<Qna> selectList(PageInfo pi);
	
	// 2. 회원 서비스 문의 작성
	int insertQna(Qna q);
	
}
