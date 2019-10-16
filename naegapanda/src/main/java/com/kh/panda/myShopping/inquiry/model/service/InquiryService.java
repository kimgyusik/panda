package com.kh.panda.myShopping.inquiry.model.service;

import java.util.ArrayList;

import com.kh.panda.myShopping.inquiry.model.vo.Inquiry;

public interface InquiryService {
	
	// 내 문의 리스트
	ArrayList<Inquiry> selectMyInquiryList(int mNo);

	// 문의 추가
	int addInquiry(Inquiry i);
	
	// 문의 삭제
	int deleteInquiry(int iId);
	
	// 문의 수정
	int updateInquiry(Inquiry i);
	
	
	// 상품 문의 리스트
	ArrayList<Inquiry> selectprodInquiryList(int pId);
	
	// 문의 답변 입력
	int answerInquiry(Inquiry i);
	
	// 문의 답변 수정
	int updateAnswerInquiry(Inquiry i);
	
}
