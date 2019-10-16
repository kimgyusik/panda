package com.kh.panda.myShopping.review.model.service;

import java.util.ArrayList;

import com.kh.panda.myShopping.review.controller.Payment;
import com.kh.panda.myShopping.review.model.vo.Commend;
import com.kh.panda.myShopping.review.model.vo.Reply;
import com.kh.panda.myShopping.review.model.vo.Review;

public interface ReviewService {
	 
	// 내 리뷰 리스트 조회
	ArrayList<Review> selectMyReviewList(int mNo);
	
	// 상품 리뷰 리스트 조회
	ArrayList<Review> selectProdReviewList(int pId);

	
	// 작성 가능한 리뷰 조회
	ArrayList<Payment> addAbleReview(int mNo);
	
	// 리뷰 선택
	Review selectReview(int rId);
	
	// 리뷰 추가
	int addReview(Review r);
	
	// 리뷰 업데이트
	int updateReview(Review r);
	
	// 리뷰 삭제
	int deleteReview(int rId);
	
	// 리뷰 좋아요/취소
	int changeCommend(Commend c, int flag);
	
	// 리플 리스트 조회
	ArrayList<Reply> getReplyList(int rId);
	
	// 리플 추가
	int addReply(Reply r);
	
	// 리플 삭제
	int deleteReply(int rrId);

}
