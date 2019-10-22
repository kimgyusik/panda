package com.kh.panda.seller.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.ProductOption;
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

		
		/*
		 * String encPwd = bcryptPasswordEncoder.encode(s.getsPwd()); s.setsPwd(encPwd);
		 */
		
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
	  
	  /*if(loginSeller != null && bcryptPasswordEncoder.matches(s.getsPwd(),
	  loginSeller.getsPwd())) {*/
	
	  if(loginSeller != null && loginSeller.getsPwd().equals(s.getsPwd())) {
	  
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
	  public ModelAndView sellerProduct(@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		 int listCount = sService.getListCount(((Seller)session.getAttribute("loginSeller")).getsNo());
			
		 PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
		 ArrayList<ProductOption> list = sService.selectList(pi, ((Seller)session.getAttribute("loginSeller")).getsNo());
		  
		  
		  
		 mv.addObject(list).addObject(pi).setViewName("seller/product/sellerProductForm");
		  
		 return mv;
	  }
	 
	  // 셀러페이지(정보수정)
	  @RequestMapping("sPage.do")
	  public String sellerPage() {
		  return "seller/sellerInfo";
	  }
	  
	  // 상품등록페이지
	  @RequestMapping("pInsert.do")
	  public ModelAndView insertProduct(ModelAndView mv) {
		  
		  ArrayList<Category> cList = sService.selectcList();
		  
		  mv.addObject("cList", cList).setViewName("seller/product/insertProductForm");
		  
		  return mv;
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
	  
	  // 아이디/비번찾기 페이지
	  @RequestMapping("findSeller.do")
	  public String findSeller() {
		  return "seller/find_sellerId_form";
	  }
	  
	  // 아이디 찾기
	  @RequestMapping(value="findsId.do", method = RequestMethod.POST)
	  public String findsId(@RequestParam("sEmail") String sEmail, Model model) throws Exception{		
		 model.addAttribute("sId", sService.findsId(sEmail));		
		 return "seller/find_sId";  
	  }
	  
	  
	  @ResponseBody	// 자동으로 response에 담겨서 반환시켜줌(String 밖에 안됨)
	  @RequestMapping("sIdCheck.do")
		public String idCheck(String sId, HttpServletResponse response) {	
			
			int result = sService.sIdCheck(sId);
			
		  
			
			if(result > 0) {	// 존재하는 아이디 있음 --> 사용 불가능"fail"
				return "fail";
				
			}else {	// 존재하는 아이디 없음 --> 사용 가능"ok" 
				return "ok";
			}
			
		}
	  
	  
	  
	  
	  // 정보수정
	  @RequestMapping("sUpdate.do")
	  public String updateSeller(Seller s, Model model, @RequestParam("post") String post,
									  				    @RequestParam("sAddress1") String sAddress1,
													    @RequestParam("sAddress2") String sAddress2,
													    @RequestParam("sbPost") String sbPost,
													    @RequestParam("sbAddress1") String sbAddress1,
													    @RequestParam("sbAddress2") String sbAddress2){
		 
		/*
		 * String encPwd = bcryptPasswordEncoder.encode(s.getsPwd()); s.setsPwd(encPwd);
		 */
		  
		  if( !post.equals("")) {
				s.setsAddress(post+ ","+sAddress1+","+sAddress2);
			}
		  if(!sbPost.equals("")) {
				s.setSbAddress(sbPost + "," + sbAddress1 + "," + sbAddress2);
			}
		  	
			int result = sService.updateSeller(s);
			
			System.out.println(s);
			
			if(result > 0) {
				model.addAttribute("loginSeller", s);
				return "redirect:sProduct.do";
			}else {
				model.addAttribute("msg", "회원 정보 수정 실패!!");
				return "common/errorPage";
			}
	  }
	  
	  @RequestMapping("confirm.do")
	  public String deleteSeller(Seller s, Model model) {
		  
		  int result = sService.deleteSeller(s);
			  
		  if(result > 0) {
			return "redirect:sLogout.do";	    
		  }else {
			  model.addAttribute("msg", "회원 탈퇴 실패");
			  return "common/errorPage";
		  }
		  
	  }
	  
	  @RequestMapping("sDelete.do")
	  public String deleteSellerPage() {
		  return "seller/sellerDeleteForm";
	  }
	 

}
