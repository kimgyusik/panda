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
		return (ArrayList)sqlSession.selectList("InquiryMapper.selectMyInquiryList", mNo);
	}
	
	public int addInquiry(Inquiry i) {
		return sqlSession.insert("InquiryMapper.addInquiry", i);
	}
	
	public int deleteInquiry(int iId) {
		return sqlSession.update("InquiryMapper.deleteInquiry", iId);
	}
	
	public int updateInquiry(Inquiry i) {
		return sqlSession.update("InquiryMapper.updateInquiry", i);
	}
	
	
	public ArrayList<Inquiry> selectprodInquiryList(int pId){
		return (ArrayList)sqlSession.selectList("InquiryMapper.selectprodInquiryList", pId);
	}
	
	public int answerInquiry(Inquiry i) {
		return sqlSession.update("InquiryMapper.answerInquiry", i);
	}
	
	public int updateAnswerInquiry(Inquiry i) {
		return sqlSession.update("InquiryMapper.updateAnswerInquiry", i);
	}
	

}
