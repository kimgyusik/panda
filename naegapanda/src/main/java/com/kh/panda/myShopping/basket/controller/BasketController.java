package com.kh.panda.myShopping.basket.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.basket.model.service.BasketService;
import com.kh.panda.myShopping.basket.model.vo.Basket;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService bService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getId();
	}
	
	@RequestMapping("basketList.ba")
	public ModelAndView selectbasketList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Basket> list = bService.selectbasketList(getmNo(session));
		
		// 이미지 가져와야함
		
		mv.addObject("list", list);
		mv.setViewName("장바구니뷰");
		
		return mv;
	}
	
	
	// 삭제는 ajax로 처리하는게 좋은지 뷰단까지 만들어봐야 앎. 
	@ResponseBody
	@RequestMapping("addBasket.ba")
	public String addBasket(Basket b, HttpSession session) {
		
		b.setmNo(getmNo(session));
		
		int result = bService.addBasket(b);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("deleteBasketList.ba")
	public String deleteBasketList(HttpSession session, @RequestParam("arr") String[] arr) {
		
		int result = bService.deleteBasketList(getmNo(session), arr);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	

}
