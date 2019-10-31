package com.kh.panda.myShopping.basket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.basket.model.service.BasketService;
import com.kh.panda.myShopping.basket.model.vo.Basket;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService baService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 내 장바구니 조회
	@RequestMapping("basketList.ba")
	public ModelAndView selectbasketList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Basket> list = baService.selectbasketList(getmNo(session));
		

		mv.addObject("list", list);
		mv.setViewName("myShopping/basket/basketList");
		
		return mv;
	}
	
	
	// 장바구니 추가 처리
	@ResponseBody
	@RequestMapping("addBasket.ba")
	public void addBasket(Basket b, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
		
		b.setmNo(getmNo(session));
		
		String msg = "";
		
		int result = baService.addBasket(b);
		
		if(result == 1 ) {
			msg = "상품을 장바구니에 추가했습니다.";
		}else if(result == 2){
			msg = "이미 장바구니에 담은 상품입니다.";
		}else {
			msg = "나며 안 된는 오류";
		}

		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(msg, response.getWriter());
		
	}
	
	// 상품 개수 수정
	@ResponseBody
	@RequestMapping("updateAmount.ba")
	public String updateAmount(HttpSession session, int oNo, int amount) {
		
		Basket b = new Basket();
		b.setmNo(getmNo(session));
		b.setoNo(oNo);
		b.setAmount(amount);
		
		int result = baService.updateAmount(b);
		//int result = 1;
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 장바구니 삭제 처리(단일)
	@ResponseBody
	@RequestMapping("deleteBasket.ba")
	public String deleteBasket(HttpSession session, int oNo) {
		
		Basket b = new Basket();
		b.setmNo(getmNo(session));
		b.setoNo(oNo);
		
		int result = baService.deleteBasket(b);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 장바구니 삭제 처리(다중)
	@RequestMapping("deleteBasketList.ba")
	public String deleteBasketList(HttpSession session, @RequestParam("arr") String[] arr) {
		
		int result = baService.deleteBasketList(getmNo(session), arr);
		
		if(result > 0 ) {
			return "redirect:basketList.ba";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 장바구니 갯수,금액(메인메뉴바)
	@RequestMapping("currentBasket.ba")
	public void currentBasket(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
		int[] arr = baService.currentBasket(getmNo(session));
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(arr, response.getWriter());
		
	}
	
	

}
