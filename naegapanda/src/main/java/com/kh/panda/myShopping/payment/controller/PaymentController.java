package com.kh.panda.myShopping.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.payment.model.service.PaymentService;
import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.myShopping.review.model.vo.Commend;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paService;
	
	// 세션 유저 번호 받아오는 로직
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
		
	// 내 결재 리스트 조회
	@RequestMapping("myPaymentList.pa")
	public ModelAndView myPaymentList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Payment> list = paService.myPaymentList(getmNo(session));
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) //년월일시분초
		
		mv.addObject("list", list);
		mv.setViewName("myShopping/payment/myPaymentList");
		
		return mv;
	}
	
	// 상품 결재 리스트 조회??
	
	// 결재 추가 처리
	@RequestMapping("addPayment.pa")
	public String addPayment(Payment p, Model model) {

		int result = paService.addPayment(p);
		
		if(result > 0) {
			return "redirect:myPaymentList.pa";
		}else {
			model.addAttribute("msg", "?????????????");
			return "common/errorPage";
		}
		
	}
	
	// 구매확정 처리
	@ResponseBody
	@RequestMapping(value="fixPayment.pa")
	public String fixPayment(int payId) throws IOException {
		
		int result = paService.fixPayment(payId);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

}
