package com.kh.panda.myShopping.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.myShopping.review.model.vo.Commend;
import com.kh.panda.myShopping.review.model.vo.Reply;
import com.kh.panda.myShopping.review.model.vo.Review;

@Repository("reDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Review> selectMyReviewList(int mNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectMyReviewList", mNo);
	}
	
	public ArrayList<Review> selectProdReviewList(int pId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectProdReviewList", pId);
	}
	
	public ArrayList<Payment> addAbleReview(int mNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.addAbleReview", mNo);
	}	
	
	public Review selectReview(int rId) {
		return sqlSession.selectOne("reviewMapper.selectReview", rId);
	}
	
	public void countUp(int rId) {
		sqlSession.update("reviewMapper.countUp");
	}
	
	public int addReview(Review r) {
		return sqlSession.insert("reviewMapper.addReview", r);
	}
	
	
	public int updateReview(Review r) {
		return sqlSession.update("reviewMapper.updateReview", r);
	}
	
	public int deleteReview(int rId) {
		return sqlSession.update("reviewMapper.deleteReview", rId);
	}
	
	public ArrayList<Commend> selectCommendList(int mNo){
		return (ArrayList)sqlSession.selectList("reviewMapper.selectCommendList", mNo);
	}
	
	public int cancleCommend(Commend c) {
		sqlSession.update("reviewMapper.decreaseCommend", c.getrId());
		return sqlSession.delete("reviewMapper.cancleCommend", c);
	}
	
	public int addCommend(Commend c) {
		sqlSession.update("reviewMapper.increaseCommend", c.getrId());
		return sqlSession.insert("reviewMapper.addCommend", c);
	}
	
	public ArrayList<Reply> getReplyList(int rId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.getReplyList", rId);
	}
	
	public int addReply(Reply r) {
		return sqlSession.insert("reviewMapper.addReply", r);
	}
	
	public int deleteReply(int rrId) {
		return sqlSession.update("reviewMapper.deleteReply", rrId);
	}
	

}
