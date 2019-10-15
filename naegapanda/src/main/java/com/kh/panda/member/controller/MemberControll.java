package com.kh.panda.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller 
public class MemberControll {
	

	@RequestMapping("join.do")
	public String joinForm() {
		
		return "member/joinForm";
	}
	
	
	@RequestMapping("allLogin.do")
	public String enrollView() {
		
		
		
		return "member/memberLoginForm";
	}
	
	@RequestMapping("mJoin.do")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	

}
