package com.kh.panda.seller.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.ProductAttachment;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.service.SellerService;
import com.kh.panda.seller.model.vo.MailHandler;
import com.kh.panda.seller.model.vo.Seller;

@SessionAttributes("loginSeller")
@Controller
public class SellerController {
	

	
	@Inject
	private JavaMailSender mailSender;

	
	
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
								) throws MessagingException{

		
		/*
		 * String encPwd = bcryptPasswordEncoder.encode(s.getsPwd()); s.setsPwd(encPwd);
		 */
		
		if(!post.equals("")) {
			s.setsAddress(post +"," + sAddress1 + "," + sAddress2);
		}
		
		if(!sbPost.equals("")) {
			s.setSbAddress(sbPost + "," + sbAddress1 + "," + sbAddress2);
		}
		
		int result = sService.insertSeller(s);
		
		int sNo = s.getsNo();
		
		MailHandler sendMail = new MailHandler(mailSender);
		String html = "<h1>메일인증</h1><a href='localhost:8012/panda/emailConfirm.do?sNo=" + sNo + "&sName="+s.getsName() + "&key=Y' target='_blenk'>이메일 인증 확인</a>";
		
		sendMail.setSubject("[PANDA 이메일 인증]");
		sendMail.setText(html);
		try {
			sendMail.setFrom("dkj01043@gmail.com", "관리자");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMail.setTo(s.getsEmail());
		sendMail.send();

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
	  
	  // 로그인 페이지
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
	 
	  // 셀러페이지(정보수정 전 재로그인)
	  @RequestMapping("sConfirm.do")
	  public String sellerConfirm() {
		  return "seller/infoConfirm";
	  }
	  
	/*
	 * // 셀러 정보 수정
	 * 
	 * @RequestMapping("sPage.do") public String sellerPage() { return
	 * "seller/sellerInfo"; }
	 */
	  
	  
	  @RequestMapping(value="sPage.do", method=RequestMethod.POST) 
	  public String updateConfirm(Seller s, Model model) {
		  
		  Seller reLoginSeller = sService.updateConfirm(s);
		
		  if(reLoginSeller != null && reLoginSeller.getsPwd().equals(s.getsPwd())) {
			  
			  model.addAttribute("reLoginSeller", reLoginSeller); return "seller/sellerInfo";
			  
			  }else {
			  
			  model.addAttribute("msg", "로그인 실패"); return "common/errorPage"; }
			  
			  }

		 
	  
	  
	  // 상품등록페이지
	  @RequestMapping("pInsertView.do")
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
	  
	  // 탈퇴
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
	  
	  // 탈퇴페이지
	  @RequestMapping("sDelete.do")
	  public String deleteSellerPage() {
		  return "seller/sellerDeleteForm";
	  }
	  
	  public String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			//resources 까지의 파일 위치를 나타냄
			String savePath = root + "\\bupload";
			// 그 뒤에 저장 경로
			
			File folder = new File(savePath);	// 저장될 폴더 (io를 import)
			if(!folder.exists()) {
				folder.mkdir();	//폴더가 없다면 폴더 생성 (make directory)
			}
			
			String originalFileName = file.getOriginalFilename();	//원본명
			
			// 파일명 수정작업 -> 년월일시분초.확장자
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) // 년월일 시분초
									+ originalFileName.substring(originalFileName.lastIndexOf("."));
			
			// 실제 저장될 경로 savePath + 저장하고자 하는 파일명 renameFileName
			String renamePath = savePath + "\\" + renameFileName; // resources\bupload\201910041131.jpg
			
			try {
				file.transferTo(new File(renamePath));
			}catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return renameFileName;	// 수정명 반환
		}
	  
	  @RequestMapping("pInsert.do")
		public String insertProduct(Product p, HttpServletRequest request, Model model,
								  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
//			System.out.println(b);
			//멀티파트를 사용하려면 관련 라이브러리를 추가해야함
			// root-context.xml에 빈으로 등록해야함 이때 사이즈 지정 가능
			// 서버에 업로드 할 때 HttpServletRequest도 있어야함
		  System.out.println(p.getpContent());
		  ProductAttachment pa = new ProductAttachment();
			
			if(!file.getOriginalFilename().equals("")) {
				// 서버에 파일 등록 ( 폴더에 저장 )
				// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
				String renameFileName = saveFile(file, request);
				
				if(renameFileName != null) {	//파일이 잘 저장된 경우
					pa.setPaOriginName(file.getOriginalFilename());
					pa.setPaChangeName(renameFileName);
				}
			}
			
//			int result = sService.insertProduct(p);
			
//			if(result > 0) {
//				return "redirect:sProduct.do";
//			} else {
//				model.addAttribute("msg", "등록에 실패했습니다");
//				return "common/errorPage";
//			}
			
			return "redirect:sProduct.do";
			
		}
	 
	  


	  
	  // 이메일 확인
	  @RequestMapping(value = "/emailConfirm.do", method = RequestMethod.GET)
	  public String emailConfirm(int sNo, String sName, Model model) throws Exception { // 이메일인증
		  
		  int result = sService.emailConfirm(sNo);
		  model.addAttribute("sName", sName);

	  	return "/seller/emailConfirm";
	  }
	  
	  
	  

}
