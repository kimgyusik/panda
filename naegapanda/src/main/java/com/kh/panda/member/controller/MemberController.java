package com.kh.panda.member.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.panda.member.model.service.MemberService;
import com.kh.panda.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller 
public class MemberController {
	
	@Autowired
	private MemberService mService;
	

	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	
	
	 @RequestMapping("Loginmove.do") public String loginView() {
	 
	 
	 return "member/memberLoginForm"; }
	 
	 
	 
	
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMember(Member m, Model model) {
		
		
		Member loginUser = mService.loginMember(m);
		
		logger.debug(loginUser.toString());
		
	
		if(loginUser != null  && loginUser.getPwd().equals(m.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "로그인 실패!!"); 
			return "common/errorPage";
		}
		
	}
		
	
	
	
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		
		
		status.setComplete();
		
		return "redirect:home.do";
	}
	
		
	
	@RequestMapping("myInfo.do")
	public String myInfoView() {
		return "member/myPage";
	}
	
	
	
	
	@RequestMapping("mupdate.do")
	public String updateMember(Member m, Model model,
							   @RequestParam("post") String post,
							   @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2) {
		
		if(!post.equals("")) { // 주소 작성해서 값이 넘어왔을 경우
			m.setAddress(post+","+address1+","+address2);
		}
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원 정보 수정 실패!!");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("mdelete.do")
	public String deleteMember(String id, Model model) {
		
		int result = mService.deleteMember(id);
		
		if(result > 0) {
			
			return "redirect:logout.do";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패!!");
			return "common/errorPage";
		}
		
	}
	
	
	
		
		@RequestMapping("enrollView.do")
		public String enrollView() {
			
			logger.debug("회원가입 페이지로 이동");
			
			return "member/memberJoinForm";
		}
		
		
		
		
		
		
		@RequestMapping("minsert.do")
		public String insertMember(Member m, Model model,
								   @RequestParam("post") String post,
								   @RequestParam("address1") String address1,
								   @RequestParam("address2") String address2) {
			
		
			
			
			
			if(!post.equals("")) {
				m.setAddress(post+","+address1+","+address2);
			}
			
			int result = mService.insertMember(m);
			
			if(result > 0) { 
				
				return "redirect:home.do"; 
			
			}else { 
				
				model.addAttribute("msg", "회원가입 실패!!");
				return "common/errorPage";
				
			}
			
		}
		
		
		
		
		
		@ResponseBody
		@RequestMapping("idCheck.do")
		public String idCheck(String id){
			
			int result = mService.idCheck(id);
			
			if(result > 0) { // 존재하는 아이디 있음 --> 사용 불가능 "fail"
				return "fail";
			}else { // 존재하는 아이디 없음 --> 사용 가능 "ok"
				return "ok";
			}
			
		}

}
