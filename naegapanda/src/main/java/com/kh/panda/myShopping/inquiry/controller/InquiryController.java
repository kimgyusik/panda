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
	private InquiryService iService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getId();
	}
	
	@RequestMapping("myInquiryList.in")
	public ModelAndView selectMyInquiryList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Inquiry> list = iService.selectMyInquiryList(getmNo(session));
		
		mv.addObject("list", list);
		mv.setViewName("내문의뷰");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("addInquiry.in")
	public String addInquiry(Inquiry i, HttpSession session) {
		
		i.setmNo(getmNo(session));
		
		int result = iService.addInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("deleteInquiry.in")
	public String deleteInquiry(int iId) {
		
		int result = iService.deleteInquiry(iId);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("updateInquiry.in")
	public String updateInquiry(HttpSession session, Inquiry i) {
		
		i.setmNo(getmNo(session));
		
		int result = iService.updateInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	// ----------------------------------------------  판매자 처리 기능 ---------------------------------------------
	
	
	@RequestMapping("prodInquiryList.in")
	public ModelAndView selectprodInquiryList(ModelAndView mv, int pId) {
		
		ArrayList<Inquiry> list = iService.selectprodInquiryList(pId);
		
		mv.addObject("list", list);
		mv.setViewName("상품상세뷰");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("answerInquiry.in")
	public String answerInquiry(HttpSession session, Inquiry i) { // 인풋: 문의번호, 답변내용
		
		int result = iService.answerInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("updateAnswerInquiry.in")
	public String updateAnswerInquiry(HttpSession session, Inquiry i) {
		
		int result = iService.updateAnswerInquiry(i);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	

}
