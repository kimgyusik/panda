package com.kh.panda.myShopping.payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		return 2;
		//return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 결재 진행 화면
	@RequestMapping("paymentPage.pa")
	public ModelAndView paymentPage(ModelAndView mv, HttpSession session) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<Basket> list = baService.selectbasketList(m.getmNo());

//		ArrayList<Basket> list = new ArrayList<>();
//		list.add(new Basket(1, 3, 2, 4, 44, "상품이름입니당", "옵션이름", 23000, "전자상품종류", "카테고리링", "이지몰", "review_1.jpg"));
//		list.add(new Basket(2, 7, 2, 5, 33, "상품222", "옵션이름22", 1111, "과자", "나또한카테고리", "물건가게", "blog_2.jpg"));

		//mv.addObject((Member)session.getAttribute("loginUser"));
		mv.addObject("m", m);
		mv.addObject("list", list);
		mv.setViewName("myShopping/payment/paymentPage");
		
		return mv;
	}
		
	// 내 결재 리스트 조회(마이쇼핑의 메인페이지)
	@RequestMapping("myPaymentList.pa")
	public ModelAndView myPaymentList(ModelAndView mv, HttpSession session) {
		

		// ArrayList<Payment> list = paService.myPaymentList(getmNo(session));
		ArrayList<Payment> list = new ArrayList<>();
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) //년월일시분초
		
		mv.addObject("list", list);
		mv.setViewName("myShopping/payment/myPaymentList");
		
		return mv;
	}
	
	// 상품 결재 리스트 조회??
	
	// 결재 추가 처리
	@RequestMapping("addPayment.pa")
	public String addPayment(Payment p, Model model, HttpSession session) {
		
		p.setmNo(getmNo(session));

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
