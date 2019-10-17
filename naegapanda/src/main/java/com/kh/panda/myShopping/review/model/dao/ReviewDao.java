package com.kh.panda.myShopping.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.myShopping.review.model.vo.Commend;
import com.kh.panda.myShopping.review.model.vo.Reply;
import com.kh.panda.myShopping.review.model.vo.Review;

@Repository("reDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Review> selectMyReviewList(int mNo) {
		return (ArrayList)sqlSession.selectList("ReviewMapper.selectMyReviewList", mNo);
	}
	
	public ArrayList<Review> selectProdReviewList(int pId) {
		return (ArrayList)sqlSession.selectList("ReviewMapper.selectProdReviewList", pId);
	}
	
	public ArrayList<Payment> addAbleReview(int mNo) {
		return (ArrayList)sqlSession.selectList("ReviewMapper.addAbleReview", mNo);
	}	
	
	public Review selectReview(int rId) {
		return sqlSession.selectOne("ReviewMapper.selectReview", rId);
	}
	
	public void countUp(int rId) {
		sqlSession.update("ReviewMapper.countUp");
	}
	
	public int addReview(Review r) {
		return sqlSession.insert("ReviewMapper.addReview", r);
	}
	
	
	public int updateReview(Review r) {
		return sqlSession.update("ReviewMapper.updateReview", r);
	}
	
	public int deleteReview(int rId) {
		return sqlSession.update("ReviewMapper.deleteReview", rId);
	}
	
	public int cancleCommend(Commend c) {
		return sqlSession.delete("ReviewMapper.cancleCommend", c);
	}
	
	public int addCommend(Commend c) {
		return sqlSession.insert("ReviewMapper.addCommend", c);
	}
	
	public ArrayList<Reply> getReplyList(int rId) {
		return (ArrayList)sqlSession.selectList("ReviewMapper.getReplyList", rId);
	}
	
	public int addReply(Reply r) {
		return sqlSession.insert("ReviewMapper.addReply", r);
	}
	
	public int deleteReply(int rrId) {
		return sqlSession.update("ReviewMapper.deleteReply", rrId);
	}
	

}
