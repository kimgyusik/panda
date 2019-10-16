package com.kh.panda.myShopping.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.review.model.dao.ReviewDao;
import com.kh.panda.myShopping.review.model.vo.Commend;
import com.kh.panda.myShopping.review.model.vo.Reply;
import com.kh.panda.myShopping.review.model.vo.Review;

@Service("reService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao reDao;

	@Override
	public ArrayList<Review> selectMyReviewList(int mNo) {
		return reDao.selectMyReviewList(mNo);
	}

	@Override
	public ArrayList<Review> selectProdReviewList(int pId) {
		return reDao.selectProdReviewList(pId);
	}

	@Override
	public ArrayList<Payment> addAbleReview(int mNo) {
		return reDao.addAbleReview(mNo);
	}

	@Override
	public Review selectReview(int rId) {
		
		reDao.countUp();
		
		return reDao.selectReview(rId);
	}

	@Override
	public int addReview(Review r) {
		return reDao.addReview(r);
	}

	@Override
	public int updateReview(Review r) {
		return reDao.updateReview(r);
	}

	@Override
	public int deleteReview(int rId) {
		return reDao.deleteReview(rId);
	}

	@Override
	public int changeCommend(Commend c, int flag) {
		
		if(flag == 0) { // 취소
			return reDao.cancleCommend(c);
		}else { // 좋아요
			return reDao.addCommend(c);
		}
		
	}

	@Override
	public ArrayList<Reply> getReplyList(int rId) {
		return reDao.getReplyList(rId);
	}

	@Override
	public int addReply(Reply r) {
		return reDao.addReply(r);
	}

	@Override
	public int deleteReply(int rrId) {
		return reDao.deleteReply(rrId);
	}

}
