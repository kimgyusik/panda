package com.kh.panda.myShopping.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.myShopping.inquiry.model.dao.InquiryDao;
import com.kh.panda.myShopping.inquiry.model.vo.Inquiry;

@Service("iService")
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDao iDao;

	@Override
	public ArrayList<Inquiry> selectMyInquiryList(int mNo) {
		return iDao.selectMyInquiryList(mNo);
	}

	@Override
	public int addInquiry(Inquiry i) {
		return iDao.addInquiry(i);
	}

	@Override
	public int deleteInquiry(int iId) {
		return iDao.deleteInquiry(iId);
	}

	@Override
	public int updateInquiry(Inquiry i) {
		return iDao.updateInquiry(i);
	}
	
	
	@Override
	public ArrayList<Inquiry> selectprodInquiryList(int pId) {
		return iDao.selectprodInquiryList(pId);
	}

	@Override
	public int answerInquiry(Inquiry i) {
		return iDao.answerInquiry(i);
	}

	@Override
	public int updateAnswerInquiry(Inquiry i) {
		return iDao.updateAnswerInquiry(i);
	}

}
