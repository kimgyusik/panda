package com.kh.panda.admin.board.qna.seller.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.seller.model.vo.SQna;
import com.kh.panda.common.PageInfo;

@Service
public interface SQnaService {
	
	// 1. 판매자 문의 게시판 전체 리스트 조회
	// 1_1. 게시판 총 갯수 조회
	int getListCount();
	// 1_2. 게시판 리스트 조회
	ArrayList<SQna> selectList(PageInfo pi);
}
