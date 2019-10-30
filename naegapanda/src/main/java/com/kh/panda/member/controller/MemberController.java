package com.kh.panda.member.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
import com.kh.panda.seller.model.service.SellerService;
import com.kh.panda.seller.model.vo.MailHandler;
import com.kh.panda.seller.model.vo.Seller;
import com.kh.panda.seller.model.vo.TempKey;



@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private SellerService sService;

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("Loginmove.do")
	public String loginView() {

		return "member/memberLoginForm";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMember(Member m, Model model, HttpSession session) {

		Member loginUser = mService.loginMember(m);

		logger.debug(loginUser.toString());

		if (loginUser != null && loginUser.getPwd().equals(m.getPwd())) {
			session.setAttribute("loginUser", loginUser);
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "로그인 실패!!");
			return "common/errorPage";
		}

	}

	
	
	// 아이디 찾기 폼 
	@RequestMapping(value = "find_id_form.do")
	public String find_id_form(){
		return "member/find_id_form";
	}

	

	
	// 아이디 찾기
		@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
		public String find_id(@RequestParam("email") String email, Model model)throws Exception{
			model.addAttribute("id", mService.find_id(email));
			return "member/find_id";
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
	public String updateMember(Member m, Model model, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2) {

		if (!post.equals("")) { // 주소 작성해서 값이 넘어왔을 경우
			m.setAddress(post + "," + address1 + "," + address2);
		}

		int result = mService.updateMember(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!!");
			return "common/errorPage";
		}

	}

	@RequestMapping("mdelete.do")
	public String deleteMember(String id, Model model) {

		int result = mService.deleteMember(id);

		if (result > 0) {

			return "redirect:logout.do";
		} else {
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
	public String insertMember(Member m, Model model, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2) {

		if (!post.equals("")) {
			m.setAddress(post + "," + address1 + "," + address2);
		}

		int result = mService.insertMember(m);

		if (result > 0) {

			return "redirect:home.do";

		} else {

			model.addAttribute("msg", "회원가입 실패!!");
			return "common/errorPage";

		}
		
		
	}
		
		
	
	

	
	
	
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {

		int result = mService.idCheck(id);

		if (result > 0) { // 존재하는 아이디 있음 --> 사용 불가능 "fail"
			return "fail";
		} else { // 존재하는 아이디 없음 --> 사용 가능 "ok"
			if (mService.idCheck(id) <= 0) {
				return "ok";
			}
			return "fail";
		}
	}
	
	
	
	
	
	@Inject
	private JavaMailSender mailSender;
	
	
	

	
	
	// 아이디/비번찾기 페이지
	@RequestMapping("find_pwd_form.do")
	public String findMember() {
		return "member/find_pwd_form";
	}
	
	
	
	
	
	@RequestMapping(value="find_Pwd.do", method=RequestMethod.POST)
	public String  findPwd(Member m, Model model, HttpServletRequest request) throws MessagingException {
		
		
		String key = new TempKey().getKey(10, false);
		m.setPwd(key);
		
		int result = mService.newPassword(m);
		
		MailHandler sendMail = new MailHandler(mailSender);
		
		sendMail.setSubject("[PANDA 비밀번호 찾기]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<h5 style='display:inline-block'>임시비밀번호 : </h5>").append(m.getPwd()).toString());
		try {
			sendMail.setFrom("dkj01043@gmail.com", "관리자");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMail.setTo(m.getEmail());
		sendMail.send();
		
		return "home";
	}
	
	
	
	 /**
	    * 비번 변경 전 재확인
	    * @param pwd
	    * @param model
	    * @return
	    */
	   @RequestMapping("pwdChange.do")
	   public String pwdChange(HttpSession session, @RequestParam("pwd") String pwd) {
		   
		   
		   
		   
		   Member mp = (Member)session.getAttribute("loginUser");
	      
		   
	     
	      
	      if(pwd != null && pwd.equals(mp.getPwd())) { 
	         Member loginUser = mService.loginMember(mp);
	         session.setAttribute("loginUser", loginUser);
	         return "member/pwdChangeAfter";
	      }else {
	         return "member/pwdChangebeFore";
	              
	      }
	      
	   }
	   
	   
	   
	   
	   /**
	    * 비번 수정
	    * @param model
	    * @param pwd
	    * @return
	    */
	   @RequestMapping("pwdChange2.do")
	   public String changePwd(HttpSession session, @RequestParam("pwd") String pwd) {
	      
		   System.out.println(pwd);
		   
		   Member mp = (Member)session.getAttribute("loginUser");
		   
	   
		   mp.setPwd(pwd);
		   
		   System.out.println(mp);
		   
		   
	      int result = mService.pwdUpdate(mp);      
	      if(result > 0) {
	         return "home";
	      }else {
	         
	         return "member/pwdCangeAfter";
	      }
	      
	   }
	   
	

}
