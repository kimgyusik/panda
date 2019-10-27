package com.kh.panda.product.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.member.model.service.MemberService;
import com.kh.panda.myShopping.review.model.service.ReviewService;
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
	
	@RequestMapping("pDetailView.do")
	public ModelAndView loginView(@RequestParam(name="pId") int pId, ModelAndView mv) {
		
		Product p = sService.selectProduct(pId);
		ArrayList<ProductAttachment> paList = sService.selectPa(p);
		ArrayList<ProductOption> poList = sService.selectPo(p);
		//ArrayList<Review> reList = reService.selectProdReviewList(pId);
		//
		
		// 리뷰 데스트 데이터 생성
		ArrayList<Review> reList = new ArrayList<>();
		Date date = new Date();
		reList.add(new Review(1, "너무 잘 받엇어요", "배송도 빠르고 물건도 좋고 다음에 또 살 거 같아요.", date, 12323, 1, "vjxmfwl", "N", 323, 13,"blog_2.jpg"));
		reList.add(new Review(2, "머이럼", "넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네넘오하네", date, 24243, 1, "WFEJWEE", "N", 221, 24, "best_6.png"));
		
		
		int result = pService.increasepCount(pId);
		
		if(result > 0) {
			mv.addObject("p", p).addObject("paList", paList).addObject("poList", poList).addObject("reList", reList).setViewName("product/productDetailView");
		} else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
}
