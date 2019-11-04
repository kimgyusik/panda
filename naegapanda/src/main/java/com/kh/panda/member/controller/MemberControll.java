package com.kh.panda.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberControll {

	@RequestMapping("join.do")
	public String joinForm() {

		return "member/joinForm";
	}

	
	
	  @RequestMapping("allLogin.do") public String enrollView() {
	 	 
	 
	  return "member/memberLoginForm"; }
	 
	  
	  
	  
	  
	  @RequestMapping("find.do")
			public String find() {
				return "member/find";
			}
		
	  
	  
	  

	// 회원가입 때 일반회원,판매자 선택하는 화면
	@RequestMapping("mJoin.do")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}

	
	// 회원가입 때 일반회원,판매자 선택하는 화면
		@RequestMapping("change.do")
		public String pwdChangebeFore() {
			return "member/pwdChangebeFore";
		}
		
		
		
			
		@RequestMapping("changePasswd.do")
		public String changePasswd() {

			return "member/changePasswd";
		}
}
