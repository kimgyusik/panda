package com.kh.panda.myShopping.payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.basket.model.service.BasketService;
import com.kh.panda.myShopping.basket.model.vo.Basket;
import com.kh.panda.myShopping.payment.model.service.PaymentService;
import com.kh.panda.myShopping.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paService;
	@Autowired
	private BasketService baService;
	
	// 세션 유저 번호 받아오는 로직
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 결재 진행 화면
	@RequestMapping("paymentPage.pa")
	public ModelAndView paymentPage(ModelAndView mv, HttpSession session) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<Basket> list = baService.selectbasketList(m.getmNo());

		mv.addObject("m", m);
		mv.addObject("list", list);
		mv.setViewName("myShopping/payment/paymentPage");
		
		return mv;
	}
		
	// 내 결재 리스트 조회(마이쇼핑의 메인페이지)
	@RequestMapping("myPaymentList.pa")
	public ModelAndView myPaymentList(ModelAndView mv, HttpSession session) {
	
		ArrayList<Payment> list = paService.myPaymentList(getmNo(session));
		
		mv.addObject("list", list);
		mv.setViewName("myShopping/payment/myPaymentList");
		
		return mv;
	}
	
	// 상품 결재 리스트 조회??
	
	// 결재 추가 처리
	@RequestMapping("addPayment.pa")
	public String addPayment(Payment p, Model model, HttpSession session, @RequestParam("flag") int flag) {
		
		int result = 0;
		
		Member m = ((Member)session.getAttribute("loginUser"));
		p.setmNo(m.getmNo());
		
		if(flag == 1) { // 기본 배송지
			p.setDeliverySpot(m.getAddress());
			p.setRecipient(m.getName());
			p.setRecipientPhone(m.getPhone());
			result = paService.addPayment(p);
		}else { // 신규 배송지
			result = paService.addPayment(p);
		}
		
		if(result > 0) {
			return "redirect:myPaymentList.pa";
		}else {
			model.addAttribute("msg", "결제 실패?");
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
