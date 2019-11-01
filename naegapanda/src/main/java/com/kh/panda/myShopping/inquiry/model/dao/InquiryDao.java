package com.kh.panda.myShopping.inquiry.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.myShopping.inquiry.model.vo.Inquiry;

@Repository("inDao")
public class InquiryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Inquiry> selectMyInquiryList(int mNo){
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectMyInquiryList", mNo);
	}
	
	public int addInquiry(Inquiry i) {
		return sqlSession.insert("inquiryMapper.addInquiry", i);
	}
	
	public int deleteInquiry(int iId) {
		return sqlSession.update("inquiryMapper.deleteInquiry", iId);
	}
	
	public int updateInquiry(Inquiry i) {
		return sqlSession.update("inquiryMapper.updateInquiry", i);
	}
	
	
	public ArrayList<Inquiry> selectprodInquiryList(int pId){
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectprodInquiryList", pId);
	}
	
	public int answerInquiry(Inquiry i) {
		return sqlSession.update("inquiryMapper.answerInquiry", i);
	}
	
	public int updateAnswerInquiry(Inquiry i) {
		return sqlSession.update("inquiryMapper.updateAnswerInquiry", i);
	}
	
	public int deleteAnswerInquiry(int iId) {
		return sqlSession.update("inquiryMapper.deleteAnswerInquiry", iId);
	}
	

}
