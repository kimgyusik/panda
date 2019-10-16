package com.kh.panda.seller.controller;

/*import org.springframework.beans.factory.annotation.Autowired;*/
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.panda.seller.model.service.SellerService;
import com.kh.panda.seller.model.vo.Seller;

@Controller
public class SellerController {
	
	/*
	 * @Autowired private SellerService sService;
	 * 
	 * @Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	 */
	
	
	// 가
	@RequestMapping("sJoin.do")
	public String InsertSeller() {
		
		return "seller/sellerJoinForm";
	
	}
	
	// 로그인
	/*
	 * @RequestMapping(value="", method=RequestMethod.POST) public String
	 * loginSeller(Seller s, Model model) {
	 * 
	 * Seller loginSeller = sService.loginSeller(s);
	 * 
	 * if(loginSeller != null && bcryptPasswordEncoder.matches(s.getsPwd(),
	 * loginSeller.getsPwd())) {
	 * 
	 * model.addAttribute("loginSeller", loginSeller); return "redirect:home.do";
	 * 
	 * }else {
	 * 
	 * model.addAttribute("msg", "로그인 실패"); return "common/errorPage"; }
	 * 
	 * }
	 */

}
