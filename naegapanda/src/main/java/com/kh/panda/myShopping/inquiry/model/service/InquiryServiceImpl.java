package com.kh.panda.myShopping.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.inquiry.model.dao.InquiryDao;
import com.kh.panda.myShopping.inquiry.model.vo.Inquiry;

@Service("inService")
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDao inDao;

	@Override
	public ArrayList<Inquiry> selectMyInquiryList(int mNo) {
		return inDao.selectMyInquiryList(mNo);
	}

	@Override
	public int addInquiry(Inquiry i) {
		return inDao.addInquiry(i);
	}

	@Override
	public int deleteInquiry(int iId) {
		return inDao.deleteInquiry(iId);
	}

	@Override
	public int updateInquiry(Inquiry i) {
		return inDao.updateInquiry(i);
	}
	
	@Override
	public ArrayList<Inquiry> selectprodInquiryList(int pId) {
		return inDao.selectprodInquiryList(pId);
	}

	@Override
	public int answerInquiry(Inquiry i) {
		return inDao.answerInquiry(i);
	}

	@Override
	public int updateAnswerInquiry(Inquiry i) {
		return inDao.updateAnswerInquiry(i);
	}

	@Override
	public int deleteAnswerInquiry(int iId) {
		return inDao.deleteAnswerInquiry(iId);
	}

}
