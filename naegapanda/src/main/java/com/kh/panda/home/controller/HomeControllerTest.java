package com.kh.panda.home.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.home.model.service.HomeService;
import com.kh.panda.product.model.vo.Product;

@Controller
public class HomeControllerTest {

	@Autowired
	private HomeService hService;
	
	
	@RequestMapping("search.do")
	public ModelAndView search(ModelAndView mv, String keyword) {
		
		ArrayList<Product> list = hService.search(keyword); 
		
		mv.addObject("list",list).setViewName("product/soojinTest");
		
		return mv;
	}
	
	
	/* @RequestMapping("") */
	
	
}
