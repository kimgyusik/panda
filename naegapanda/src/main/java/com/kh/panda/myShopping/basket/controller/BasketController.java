package com.kh.panda.myShopping.basket.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		
		//ArrayList<Basket> list = baService.selectbasketList(getmNo(session));
		ArrayList<Basket> list = new ArrayList<>();
		list.add(new Basket(1, 3, 2, 4, 44, "상품이름입니당", "옵션이름", 23000, "전자상품종류", "카테고리링", "이지몰", "review_1.jpg"));
		list.add(new Basket(2, 7, 2, 5, 33, "상품222", "옵션이름22", 1111, "과자", "나또한카테고리", "물건가게", "new_3.jpg"));
		
		// 이미지 잘 가져오는지 체크
		
		mv.addObject("list", list);
		mv.setViewName("myShopping/basket/basketList");
		
		return mv;
	}
	
	
	// 장바구니 추가 처리
	@ResponseBody
	@RequestMapping("addBasket.ba")
	public String addBasket(Basket b, HttpSession session) {
		
		b.setmNo(getmNo(session));
		
		int result = baService.addBasket(b);
		// 삭제는 ajax로 처리하는게 좋은지 뷰단까지 만들어봐야 앎. 
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 상품 개수 수정
	@ResponseBody
	@RequestMapping("updateAmount.ba")
	public String updateAmount(HttpSession session, int oNo, int amount) {
		
		Basket b = new Basket();
		//b.setmNo(getmNo(session));
		b.setoNo(oNo);
		b.setAmount(amount);
		
		// int result = baService.updateAmount(b);
		int result = 1;
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
			return "redirect:basketList.ba";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 장바구니 삭제 처리(다중)
	@ResponseBody
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
	public void currentBasket(HttpServletResponse response) throws JsonIOException, IOException {
		
		int[] arr = new int[2];
		arr[0] = 2;
		arr[1] = 34444;
		
		//int[] arr = baService.currentBasket(getmNo(session));
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(arr, response.getWriter());
		
	}
	
	

}
