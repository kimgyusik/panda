package com.kh.panda.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.panda.seller.model.service.SellerService;
import com.kh.panda.seller.model.vo.Seller;

@SessionAttributes("loginSeller")
@Controller
public class SellerController {

	
	@Autowired private SellerService sService;
	  
	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	 
	

	// 가입화면
	@RequestMapping("sJoin.do")
	public String InsertSeller() {

return "seller/sellerJoinForm";

	}
	
	
	// 가입하기
	@RequestMapping("sinsert.do")
	public String insertMember(Seller s, Model model,
								@RequestParam("post") String post,
								@RequestParam("sAddress1") String sAddress1,
								@RequestParam("sAddress2") String sAddress2,
								@RequestParam("sbPost") String sbPost,
								@RequestParam("sbAddress1") String sbAddress1,
								@RequestParam("sbAddress2") String sbAddress2
								){

		//System.out.println(post + "," + sAddress1 + "," + sAddress2);
		//System.out.println(sbPost + "," + sbAddress1 + "," + sbAddress2);
		
		String encPwd = bcryptPasswordEncoder.encode(s.getsPwd());
		s.setsPwd(encPwd);
		
		if(!post.equals("")) {
			s.setsAddress(post +"," + sAddress1 + "," + sAddress2);
		}
		
		if(!sbPost.equals("")) {
			s.setSbAddress(sbPost + "," + sbAddress1 + "," + sbAddress2);
		}
		
		System.out.println(s);
		int result = sService.insertSeller(s);
		if (result > 0) {	
			
			return "redirect:home.do";	
		}else {	
			
			return "common/errorPage";
		}
	}
	

	  // 로그인
	  @RequestMapping(value="sLogin.do", method=RequestMethod.POST) 
	  public String loginSeller(Seller s, Model model) {

		  Seller loginSeller = sService.loginSeller(s);
	  
	  if(loginSeller != null && bcryptPasswordEncoder.matches(s.getsPwd(),
	  loginSeller.getsPwd())) {
	  
	  model.addAttribute("loginSeller", loginSeller); return "redirect:sProduct.do";
	  
	  }else {
	  
	  model.addAttribute("msg", "로그인 실패"); return "common/errorPage"; }
	  
	  }
	  
	  @RequestMapping("sellerLogin.do")
	  public String sellerLogin() {
		  
		  return "seller/sellerLoginForm";
	  }
	  
	  
	  // 로그아웃
	  @RequestMapping("sLogout.do")
	  public String sellerLogout(SessionStatus status) {
		  
		  status.setComplete();
		  
		return "redirect:home.do";
		  
		  
	  }
	  
	  // 셀러상품관리페이지
	  @RequestMapping("sProduct.do")
	  public String sellerProduct() {
		  return "seller/product/sellerProductForm";
	  }
	 
	  // 셀러페이지(정보수정)
	  @RequestMapping("sPage.do")
	  public String sellerPage() {
		  return "seller/sellerInfo";
	  }
	  
	  // 상품등록페이지
	  @RequestMapping("pInsert.do")
	  public String insertProduct() {
		  return "seller/product/insertProductForm";
	  }
	  
	  // 주문들어온 상품페이지
	  @RequestMapping("oderPage.do")
	  public String oderProduct() {
		  return "seller/product/oderProductForm";
	  }
	 
	  // 방송관리
	  @RequestMapping("streaming.do")
	  public String sellerStreaming() {
		  return "seller/sellerStreamingForm";
	  }

}
