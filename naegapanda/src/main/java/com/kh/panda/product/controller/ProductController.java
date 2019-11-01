package com.kh.panda.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.kh.panda.member.model.service.MemberService;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.ggim.model.service.GgimService;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;
import com.kh.panda.myShopping.inquiry.model.service.InquiryService;
import com.kh.panda.myShopping.inquiry.model.vo.Inquiry;
import com.kh.panda.myShopping.review.model.service.ReviewService;
import com.kh.panda.myShopping.review.model.vo.Commend;
import com.kh.panda.myShopping.review.model.vo.Review;
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
	
	@Autowired
	private ReviewService reService;
	
	@Autowired
	private GgimService ggService;
	
	@Autowired
	private InquiryService inService;
	
	
	@RequestMapping("test11.do")
	public String test11(@RequestParam(value="category", defaultValue="1000") int category, HttpServletResponse response, Model model) throws JsonIOException, IOException{
		
		System.out.println(category);
		ArrayList<Product> HotTopList = pService.HotTopList(category);
		
	      response.setContentType("application/json; charset=utf-8"); 
	      
		
		  Gson gson = new Gson(); gson.toJson(HotTopList, response.getWriter());
		 
	      
	      model.addAttribute("HotTopList", HotTopList);
	      
	      return "home";
		
		
	}
	
	@RequestMapping("pDetailView.do")
	public ModelAndView loginView(@RequestParam(name="pId") int pId, ModelAndView mv, HttpSession session) {
		
		Product p = sService.selectProduct(pId);
		ArrayList<ProductAttachment> paList = sService.selectPa(p);
		ArrayList<ProductOption> poList = sService.selectPo(p);
		
		// 해당 상품 리뷰 리스트
		ArrayList<Review> reList = reService.selectProdReviewList(pId);	
		
		// 세션유저가 좋아요 한 리뷰 리스트
		ArrayList<Commend> rcList = new ArrayList<>();
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m != null) {
			rcList = reService.selectCommendList(m.getmNo());
		}
		
		// 상품 문의 리스트
		ArrayList<Inquiry> inqList =  inService.selectprodInquiryList(pId);
		
		// 상세화면 진입 시 조회수 증가
		int result = pService.increasepCount(pId);
		
		
		

		
		
		if(result > 0) {
			mv.addObject("p", p).addObject("paList", paList).addObject("poList", poList).addObject("reList", reList).addObject("rcList", rcList).addObject("inqList", inqList).setViewName("product/productDetailView");
		} else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("pDelete.do")
	public String pDelete(@RequestParam(name="oNo") int oNo,@RequestParam(name="pId") int pId, @RequestParam(name="currentPage", required = false, defaultValue = "1") int currentPage ) {
		int result = pService.deleteOption(oNo);
		int result2 = 0;
		if(result > 0) {
			int count = pService.oCount(pId);
			
			if(count == 0) {
				result2 = pService.deleteProduct(pId);
				
				if(result2>0) {
					return "redirect:sProduct.do?currentPage="+currentPage;
				} else {
					return "common/errorPage";
				}
			}
			
			return "redirect:sProduct.do?currentPage="+currentPage;
		} else {
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("pListView.do")
	public ModelAndView pListView(@RequestParam(name="keyword", required=false, defaultValue = "*")String keyword,
								@RequestParam(name="currentPage", required=false, defaultValue = "1") int currentPage,
								@RequestParam(name="category", required=false, defaultValue = "1000") int category,
								ModelAndView mv, HttpSession session) {
		
		int listCount = pService.getListCount(category);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		System.out.println(listCount);
		ArrayList<Product> pList = pService.selectpList(pi, category);
		ArrayList<Ggim> gglist = getGgimList(session);
		System.out.println(pi);
		mv.addObject("pList", pList).addObject("pi", pi).addObject("category", category).addObject("gglist",gglist).setViewName("product/productListView");
		
		return mv;
	}
	
	@RequestMapping("search.do")
	public ModelAndView search(@RequestParam(name="keyword", required=false, defaultValue = "*")String keyword,
								@RequestParam(name="currentPage", required=false, defaultValue = "1") int currentPage,
								@RequestParam(name="category", required=false, defaultValue = "1000") int category,
								ModelAndView mv, HttpSession session) {
		int listCount = pService.getListCount(keyword, category);
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		
		ArrayList<Product> pList = pService.search(keyword,pi,category); 
		/*
		 * System.out.println(keyword); System.out.println(category);
		 * System.out.println(pList); System.out.println(listCount);
		 * System.out.println(pi);
		 */
		
		ArrayList<Ggim> gglist = getGgimList(session);
		
		
		 if(listCount == 0) { 
			 pi.setMaxPage(1); 
			 }
		 
		
		mv.addObject("pList", pList).addObject("pi", pi).addObject("category", category).addObject("gglist",gglist).setViewName("product/productListView");
		return mv;
	}
	
	// 로그인회원에 대한 찜리스트 반환
	public ArrayList<Ggim> getGgimList(HttpSession session){
		
		ArrayList<Ggim> gglist = new ArrayList<>();
		
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {gglist = ggService.selectGgimList(m.getmNo());}
		
		return gglist;
	}
}
