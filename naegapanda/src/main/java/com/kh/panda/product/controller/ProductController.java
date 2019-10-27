package com.kh.panda.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.member.model.service.MemberService;
import com.kh.panda.product.model.service.ProductService;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.ProductAttachment;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.service.SellerService;

@SessionAttributes("loginUser")
@Controller
public class ProductController {
	
	@Autowired
	private MemberService mService;

	@Autowired
	private SellerService sService;
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping("pDetailView.do")
	public ModelAndView loginView(@RequestParam(name="pId") int pId, ModelAndView mv) {
		
		Product p = sService.selectProduct(pId);
		ArrayList<ProductAttachment> paList = sService.selectPa(p);
		ArrayList<ProductOption> poList = sService.selectPo(p);
		
		int result = pService.increasepCount(pId);
		
		if(result > 0) {
			mv.addObject("p", p).addObject("paList", paList).addObject("poList", poList).setViewName("product/productDetailView");
		} else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("pDelete.do")
	public String pDelete(@RequestParam(name="oNo") int oNo, @RequestParam(name="currentPage", required = false, defaultValue = "1") int currentPage ) {
		int result = pService.deleteOption(oNo);
		
		if(result > 0) {
			return "redirect:sProduct.do?currentPage="+currentPage;
		} else {
			
			return "common/errorPage";
		}
		
	}
}
