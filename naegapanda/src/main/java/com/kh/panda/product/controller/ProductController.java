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
		
		// 리뷰 좋아요 데이터
		ArrayList<Commend> rcList = new ArrayList<>();
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m != null) {
			rcList = reService.selectCommendList(m.getmNo());
		}
		
		ArrayList<Review> reList = reService.selectProdReviewList(pId);
//		// 리뷰 데스트 데이터 생성
//		ArrayList<Review> reList = new ArrayList<>();
//		Date date = new Date();
//		reList.add(new Review(1, "너무 잘 받엇어요", "배송도 빠르고 물건도 좋고 다음에 또 살 거 같아요.", date, 12323, 1, "vjxmfwl", "N", 323, 13,"blog_2.jpg"));
//		reList.add(new Review(2, "머이럼", "넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네", date, 24243, 1, "WFEJWEE", "N", 221, 24, "best_6.png"));
		
		
		int result = pService.increasepCount(pId);
		
		if(result > 0) {
			mv.addObject("p", p).addObject("paList", paList).addObject("poList", poList).addObject("reList", reList).addObject("rcList", rcList).setViewName("product/productDetailView");
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
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		
		ArrayList<Product> pList = pService.selectpList(pi, category);
		
		ArrayList<Ggim> gglist = getGgimList(session);
		
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
		System.out.println(keyword);
		System.out.println(category);
		System.out.println(pList);
		
		ArrayList<Ggim> gglist = getGgimList(session);
		
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
