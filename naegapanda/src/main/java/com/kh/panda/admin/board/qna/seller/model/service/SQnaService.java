package com.kh.panda.admin.board.qna.seller.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.panda.admin.board.qna.seller.model.vo.SAnswer;
import com.kh.panda.admin.board.qna.seller.model.vo.SQna;
import com.kh.panda.common.PageInfo;

@Service
public interface SQnaService {

	// 1. 판매자회원 서비스 문의 게시판 전체 리스트 조회
	// 1_1. 게시판 총 갯수 조회
	int getListCount();
	// 1_2. 게시판 리스트 조회
	ArrayList<SQna> selectList(PageInfo pi);
	
	// 2. 회원 서비스 문의 작성
	int insertSQna(SQna q);
	
	// 3. 회원 서비스 문의 상세 조회
	SQna sqnaDetail(int sqId);
	
	// 4. 회원 서비스 문의 수정
	int updateSQna(SQna q);
	
	// 5. 회원 서비스 문의 삭제
	int deleteSQna(int sqId);
	
	// 6. 회원 서비스 문의 답변 작성
	int insertSAnswer(SAnswer a);
	
	// 7. 회원 서비스 문의 답변 리스트 조회
	ArrayList<SAnswer> selectSAList();
	
	// 8. 회원 서비스 문의 답변 상세 조회
	SAnswer sanswerDetail(int sqId);
	
	// 9. 회원 서비스 문의 답변 삭제
	int deleteSAnswer(int sqId);
}
