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
import com.kh.panda.product.model.vo.Product;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paService;
	@Autowired
	private BasketService baService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 일반결재 진행 화면
	@RequestMapping("paymentPage.pa")
	public ModelAndView paymentPage(ModelAndView mv, HttpSession session) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<Basket> list = baService.selectbasketList(m.getmNo());

		mv.addObject("m", m);
		mv.addObject("list", list);
		mv.addObject("flag2", 1);
		mv.setViewName("myShopping/payment/paymentPage");
		
		return mv;
	}
	
	// 바로결재 진행 화면
	@RequestMapping("paymentPage2.pa")
	public ModelAndView paymentPage2(Basket b, ModelAndView mv, HttpSession session) {
		// oNo, amount, price 받으면됨
		Member m = ((Member)session.getAttribute("loginUser"));
		
		Basket b2 = baService.selectProductByoNo(b.getoNo());
		b2.setAmount(b.getAmount());
		b2.setPrice(b.getPrice());

		ArrayList<Basket> list = new ArrayList<>();
		
		list.add(b2);
				
		mv.addObject("m", m);
		mv.addObject("list", list);
		mv.addObject("flag2", 2);
		mv.setViewName("myShopping/payment/paymentPage");
		
		return mv;
	}
		
	// 내 결재 리스트 조회
	@RequestMapping("myPaymentList.pa")
	public ModelAndView myPaymentList(ModelAndView mv, HttpSession session) {
	
		ArrayList<Payment> list = paService.myPaymentList(getmNo(session));
		
		mv.addObject("list", list);
		mv.setViewName("myShopping/payment/myPaymentList");
		
		return mv;
	}
	
	// 결재 추가 처리
	@RequestMapping("addPayment.pa")
	public String addPayment(Payment p, Model model, HttpSession session, @RequestParam("flag") int flag, @RequestParam("flag2") int flag2) {
		
		int result = 0;
		
		Member m = ((Member)session.getAttribute("loginUser"));
		p.setmNo(m.getmNo());
		
		if(flag == 1) { // 기본 배송지
			p.setDeliverySpot(m.getAddress());
			p.setRecipient(m.getName());
			p.setRecipientPhone(m.getPhone());
		}else {} // 신규 배송지
			
		result = paService.addPayment(p, flag2);
		
		if(result > 0) {
			return "redirect:myPaymentList.pa";
		}else {
			model.addAttribute("msg", "결제 실패?");
			return "common/errorPage";
		}
		
	}
	
	// 배송완료 처리
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
