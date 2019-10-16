package com.kh.panda.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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

		System.out.println(post + "," + sAddress1 + "," + sAddress2);
		System.out.println(sbPost + "," + sbAddress1 + "," + sbAddress2);
		
		/*
		 * 1. 한글이 깨짐
		 * 		--> 스프링에서 제공하는 필터이용해보자!! --> web.xml
		 * 
		 * 2. 나이 같은 경우 값을 입력하지 않고 넘어오게 되면 빈문자열""로 넘어오는데
		 * 	    이때String"" --> int age 주입할 수 없기 때문에 문제 발생 --> BadRequest (400)
		 * 
		 * 3. 비밀번호가 평문으로 되어있다. 즉, 암호화를 거쳐 DB에 저장해야됨!!
		 * 	   스프링 시큐리티 모듈에서 제공하는 bcrypt 통해서 암호화!!
		 * 
		 * 	 * bcrypt 방식
		 * 	      사용자가 입력한 비밀번호 + (랜덤값) 
		 * 
		 */
		
		//System.out.println(bcryptPasswordEncoder.encode(m.getPwd()));
		
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
		if (result > 0) {	// 회원가입에 성공했을 경우
			
			return "redirect:home.do";	// request.getRequestDispatcher("home.jsp").forward
		}else {	// 회원가입에 실패했을 경우
			
			return "common/errorPage";
		}
	}
	

		// 로그인
	  @RequestMapping(value="", method=RequestMethod.POST) 
	  public String loginSeller(Seller s, Model model) {
	  
	  Seller loginSeller = sService.loginSeller(s);
	  
	  if(loginSeller != null && bcryptPasswordEncoder.matches(s.getsPwd(),
	  loginSeller.getsPwd())) {
	  
	  model.addAttribute("loginSeller", loginSeller); return "redirect:home.do";
	  
	  }else {
	  
	  model.addAttribute("msg", "로그인 실패"); return "common/errorPage"; }
	  
	  }
	 
	 

}
