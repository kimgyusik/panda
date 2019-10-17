package com.kh.panda.myShopping.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.basket.model.vo.Basket;
import com.kh.panda.myShopping.inquiry.model.service.InquiryService;
import com.kh.panda.myShopping.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getMno();
	}
	
	// 내 문의 리스트 조회
	@RequestMapping("myInquiryList.in")
	public ModelAndView selectMyInquiryList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Inquiry> list = inService.selectMyInquiryList(getmNo(session));
		
		mv.addObject("list", list);
		mv.setViewName("내문의뷰");
		
		return mv;
	}
	
	// 문의 추가 처리
	@ResponseBody
	@RequestMapping("addInquiry.in")
	public String addInquiry(Inquiry i, HttpSession session) {
		
		i.setmNo(getmNo(session));
		
		int result = inService.addInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 문의 삭제 처리
	@ResponseBody
	@RequestMapping("deleteInquiry.in")
	public String deleteInquiry(int iId) {
		
		int result = inService.deleteInquiry(iId);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 문의 수정 처리
	@ResponseBody
	@RequestMapping("updateInquiry.in")
	public String updateInquiry(HttpSession session, Inquiry i) {
		
		i.setmNo(getmNo(session));
		
		int result = inService.updateInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	// ----------------------------------------------  판매자 처리 기능 ---------------------------------------------
	
	// 상품 문의 리스트 조회
	@RequestMapping("prodInquiryList.in")
	public ModelAndView selectprodInquiryList(ModelAndView mv, int pId) {
		
		ArrayList<Inquiry> list = inService.selectprodInquiryList(pId);
		
		mv.addObject("list", list);
		mv.setViewName("상품상세뷰");
		
		return mv;
	}
	
	// 문의 답변 등록 처리
	@ResponseBody
	@RequestMapping("answerInquiry.in")
	public String answerInquiry(HttpSession session, Inquiry i) { // 인풋: 문의번호, 답변내용
		
		int result = inService.answerInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 문의 답변 수정 처리
	@ResponseBody
	@RequestMapping("updateAnswerInquiry.in")
	public String updateAnswerInquiry(HttpSession session, Inquiry i) {
		
		int result = inService.updateAnswerInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	

}
