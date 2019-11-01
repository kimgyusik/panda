package com.kh.panda.seller.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.ProductAttachment;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.service.SellerService;
import com.kh.panda.seller.model.vo.MailHandler;
import com.kh.panda.seller.model.vo.Seller;
import com.kh.panda.seller.model.vo.TempKey;

@SessionAttributes("loginSeller")
@Controller
public class SellerController {

	@Inject
	private JavaMailSender mailSender;
	

	@Autowired
	private SellerService sService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 가입화면
	@RequestMapping("sJoin.do")
	public String InsertSeller() {
		
        Document doc = null;
        
     String S_BNUM = "1108134859"; //2208110886
     
      try {
        doc = Jsoup.connect("https://www.pps.go.kr/gpass/gpassCompany/selectCompanyInfo.do?bizNo="+S_BNUM).get();
          System.out.println("회사명(한글)::"+doc.getElementById("corpNm").val());
          System.out.println("회사명(한글)::"+doc.getElementById("suprAddr").val());
     } catch (IOException e) {
        e.printStackTrace();
     }
         
//        <input id="corpNm" name="corpNm" type="hidden" value="주식회사 아프리카티비"/>
//        <input id="engCorpNm" name="engCorpNm" type="hidden" value="AfreecaTV Co,.Ltd"/>
//        <input id="estblshDt" name="estblshDt" type="hidden" value="1996-04-22"/>
//        <input id="ordnrytmLbrerNum" name="ordnrytmLbrerNum" type="hidden" value="370"/>
//        <input id="suprAddr" name="suprAddr" type="hidden" value="경기도 성남시 분당구 판교로228번길"/>
//        <input id="suprDtlAddr" name="suprDtlAddr" type="hidden" value="15, 2동 2층(삼평동, 판교세븐밴처밸리 1단지)"/>
//        <input id="hmpg" name="hmpg" type="hidden" value="www.afreecatv.com"/>
//        <input id="ceoNm" name="ceoNm" type="hidden" value="서수길"/>
//        <input id="ceoEmail" name="ceoEmail" type="hidden" value="zenith@afreecatv.com"/>
//        <input id="ceoMtelNo" name="ceoMtelNo" type="hidden" value="010-7181-0524"/>

		return "seller/sellerJoinForm";

	}

	// 가입하기
	@RequestMapping("sinsert.do")
	public String insertMember(Seller s, Model model, @RequestParam("post") String post,
			@RequestParam("sAddress1") String sAddress1, @RequestParam("sAddress2") String sAddress2) throws MessagingException {

		/*
		 * String encPwd = bcryptPasswordEncoder.encode(s.getsPwd()); s.setsPwd(encPwd);
		 */

		if (!post.equals("")) {
			s.setsAddress(post + "," + sAddress1 + "," + sAddress2);
		}
	 		

		int result = sService.insertSeller(s);

		
		MailHandler sendMail = new MailHandler(mailSender);
		String html = "<h1><label style='color:#0e8ce4'>메일인증</label>안내입니다.</h1><br><br><h4>안녕하세요</h4><h4>내가판다를 이용해주셔서 진심으로 감사합니다.</h4><h4 style='display:inline-block'>여기</h4><a style='display:inline-block' href='localhost:8012/panda/emailConfirm.do?sId=" + s.getsId() + "&sName=" + s.getsName()+ "&s_email_key=Y' target='_blank'>메일 인증</a><h4 style='display:inline-block'>을 눌러 이메일을 인증해주세요</h4>";

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
		} else {

			return "common/errorPage";
		}
	}
	
	
	
	@RequestMapping(value = "/emailConfirm.do", method = RequestMethod.GET)
	public String emailConfirm(String sId, String sName, Model model) throws Exception { // 이메일인증

		int result = sService.emailConfirm(sId);
		model.addAttribute("sName", sName);

		return "/seller/emailConfirm";
	}
	
	
	
	

	// 로그인
	@RequestMapping(value = "sLogin.do", method = RequestMethod.POST)
	public String loginSeller(Seller s, Model model) {

		Seller loginSeller = sService.loginSeller(s);
		
		/*
		 * System.out.println(loginSeller); System.out.println(s);
		 */
		
		
		/*
		 * if(loginSeller != null && bcryptPasswordEncoder.matches(s.getsPwd(),
		 * loginSeller.getsPwd())) {
		 */
		
		/*
		 * if (loginSeller != null && loginSeller.getsPwd().equals(s.getsPwd())) {
		 * 
		 * model.addAttribute("loginSeller", loginSeller); return
		 * "redirect:sProduct.do";
		 *
		 */
		
		if (loginSeller != null && loginSeller.getsPwd().equals(s.getsPwd())  && loginSeller.getsStatus().equals("Y")) {

			model.addAttribute("loginSeller", loginSeller);
			return "redirect:sProduct.do";

		} else if(loginSeller.getsEmailKey().equals("N")){
			model.addAttribute("msg", "이메일 인증을 완료해주세요.");
			model.addAttribute("url", "sellerLogin.do");
			return "common/errorAlert";

		} else if(loginSeller.getsStatus().equals("N")){
			model.addAttribute("msg", "탈퇴또는 정지 당한 회원입니다."); 
			model.addAttribute("url", "sellerLogin.do");
			return "common/errorAlert";
			 
		} else {
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀립니다.");
			model.addAttribute("url", "sellerLogin.do");
			return "common/errorAlert";
		}

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
	public ModelAndView sellerProduct(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpSession session, ModelAndView mv) {
		int listCount = sService.getListCount(((Seller) session.getAttribute("loginSeller")).getsNo());

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println(pi);
		ArrayList<ProductOption> list = sService.selectList(pi,
				((Seller) session.getAttribute("loginSeller")).getsNo());
		mv.addObject("list", list).addObject("pi",pi).setViewName("seller/product/sellerProductForm");

		return mv;
	}


	// 상품등록페이지m
	@RequestMapping("pInsertView.do")
	public ModelAndView insertProduct(ModelAndView mv) {

		ArrayList<Category> cList = sService.selectcList();

		mv.addObject("cList", cList).setViewName("seller/product/insertProductForm");

		return mv;
	}

	// 주문들어온 상품페이지
	@RequestMapping("oderPage.do")
	public ModelAndView oderProduct(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpSession session, ModelAndView mv) {
		int oListCount = sService.oListCount(((Seller) session.getAttribute("loginSeller")).getsNo());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, oListCount);
		System.out.println(pi);
		ArrayList<Payment> oList = sService.selectoList(pi, ((Seller) session.getAttribute("loginSeller")).getsNo());
		mv.addObject("oList", oList).addObject("pi", pi).setViewName("seller/product/oderProductForm");
		
		return mv;
	}

	// 방송관리
	@RequestMapping("streaming.do")
	public String sellerStreaming() {
		return "seller/sellerStreamingForm";
	}
	
	// 셀러페이지(정보수정)
		@RequestMapping("sPage.do")
		public String sellerPage() {
			return "seller/sellerInfo";
		}

	// 아이디/비번찾기 페이지
	@RequestMapping("findSeller.do")
	public String findSeller() {
		return "seller/find_sellerId_form";
	}

	// 아이디 찾기
	@RequestMapping(value = "findsId.do", method = RequestMethod.POST)
	public String findsId(@RequestParam("sEmail") String sEmail, Model model) throws Exception {
		model.addAttribute("sId", sService.findsId(sEmail));
		return "seller/find_sId";
	}

	@ResponseBody // 자동으로 response에 담겨서 반환시켜줌(String 밖에 안됨)
	@RequestMapping("sIdCheck.do")
	public String idCheck(String sId, HttpServletResponse response) {

		int result = sService.sIdCheck(sId);

		if (result > 0) { // 존재하는 아이디 있음 --> 사용 불가능"fail"
			return "fail";

		} else { // 존재하는 아이디 없음 --> 사용 가능"ok"
			return "ok";
		}
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

	@RequestMapping(value = "sPage.do", method = RequestMethod.POST)
	public String updateConfirm(Seller s, Model model) {

		Seller reLoginSeller = sService.updateConfirm(s);

		if (reLoginSeller != null && reLoginSeller.getsPwd().equals(s.getsPwd())) {

			model.addAttribute("reLoginSeller", reLoginSeller);
			return "seller/sellerInfo";

		} else {

			model.addAttribute("msg", "비밀번호가 틀립니다.");
			return "common/errorPage";
		}

	}

	// 정보수정
	@RequestMapping("sUpdate.do")
	public String updateSeller(Seller s, Model model, @RequestParam("post") String post,
			@RequestParam("sAddress1") String sAddress1, @RequestParam("sAddress2") String sAddress2) {

		/*
		 * String encPwd = bcryptPasswordEncoder.encode(s.getsPwd()); s.setsPwd(encPwd);
		 */

		if (!post.equals("")) {
			s.setsAddress(post + "," + sAddress1 + "," + sAddress2);
		}

		int result = sService.updateSeller(s);

		System.out.println(s);

		if (result > 0) {
			model.addAttribute("loginSeller", s);
			return "redirect:sProduct.do";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!!");
			return "common/errorPage";
		}
	}


	// 탈퇴
	@RequestMapping("confirm.do")
	public String deleteSeller(Seller s, Model model) {

		int result = sService.deleteSeller(s);

		if (result > 0) {
			return "redirect:sLogout.do";
		} else {
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
//		String root = "resources";
		// resources 까지의 파일 위치를 나타냄
		String savePath = root + "\\product_uploadFiles";
		// 그 뒤에 저장 경로

		File folder = new File(savePath); // 저장될 폴더 (io를 import)
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 폴더 생성 (make directory)
		}

		String originalFileName = file.getOriginalFilename(); // 원본명

		// 파일명 수정작업 -> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ((int)(Math.random()*10000)+1) // 년월일 시분초 
				+ originalFileName.substring(originalFileName.lastIndexOf("."));

		// 실제 저장될 경로 savePath + 저장하고자 하는 파일명 renameFileName
		String renamePath = savePath + "\\" + renameFileName; // resources\bupload\201910041131.jpg

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return renameFileName; // 수정명 반환
	}
	
	
	@RequestMapping(value = "pInsert.do", method = RequestMethod.POST)
	public String insertProduct(Product p, HttpServletRequest request,Model model, ModelAndView mv, @RequestParam("oName") String[] oName,
			 @RequestParam("oPrice") int[] oPrice, @RequestParam("oAmount") int[] oAmount,
			@RequestParam(name = "uploadFile1", required = false) MultipartFile file1,
			@RequestParam(name = "uploadFile2", required = false) MultipartFile file2,
			@RequestParam(name = "uploadFile3", required = false) MultipartFile file3) {
//			System.out.println(b);
		// 멀티파트를 사용하려면 관련 라이브러리를 추가해야함
		// root-context.xml에 빈으로 등록해야함 이때 사이즈 지정 가능
		// 서버에 업로드 할 때 HttpServletRequest도 있어야함
		String root = request.getSession().getServletContext().getRealPath("resources");
		// resources 까지의 파일 위치를 나타냄
		String savePath = root + "\\product_uploadFiles";
		
		
		ArrayList<ProductAttachment> paList = new ArrayList<>();
		ArrayList<ProductOption> poList = new ArrayList<>();
		int fileLevelCheck = 1;
		
		for(int i=0; i<oName.length; i++) {
			ProductOption po = new ProductOption();
			po.setoName(oName[i]);
			po.setoPrice(oPrice[i]);
			po.setoAmount(oAmount[i]);
			poList.add(po);
		}
			
		if(!file1.getOriginalFilename().equals(""))
	
		{
			// 서버에 파일 등록 ( 폴더에 저장 )
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
			String renameFileName = saveFile(file1, request);
			System.out.println(renameFileName);
			if (renameFileName != null) { // 파일이 잘 저장된 경우
				ProductAttachment pa = new ProductAttachment();
				pa.setPaOriginName(file1.getOriginalFilename());
				pa.setPaChangeName(renameFileName);
				pa.setPaFileLevel(1);
				pa.setFilePath(savePath);
				paList.add(pa);
			}
		}if(!file2.getOriginalFilename().equals(""))
		{
			// 서버에 파일 등록 ( 폴더에 저장 )
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
			String renameFileName = saveFile(file2, request);
			System.out.println(renameFileName);
			if (renameFileName != null) { // 파일이 잘 저장된 경우
				ProductAttachment pa = new ProductAttachment();
				pa.setPaOriginName(file2.getOriginalFilename());
				pa.setPaChangeName(renameFileName);
				pa.setPaFileLevel(2);
				pa.setFilePath(savePath);
				fileLevelCheck = 2;
				paList.add(pa);
			}
		}if(!file3.getOriginalFilename().equals(""))
		{
			// 서버에 파일 등록 ( 폴더에 저장 )
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
			String renameFileName = saveFile(file3, request);
			System.out.println(renameFileName);
			if (renameFileName != null) { // 파일이 잘 저장된 경우
				ProductAttachment pa = new ProductAttachment();
				pa.setPaOriginName(file3.getOriginalFilename());
				pa.setPaChangeName(renameFileName);
				pa.setFilePath(savePath);
				if (fileLevelCheck == 1) {
					pa.setPaFileLevel(2);
				} else if (fileLevelCheck == 2) {
					pa.setPaFileLevel(3);
				}
				paList.add(pa);
			}
		}

		int result = sService.insertProduct(p, paList, poList);

		if(result > 0) {
			return "redirect:sProduct.do";
		} else {
			model.addAttribute("msg", "등록에 실패했습니다");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping(value = "pUpdate.do", method = RequestMethod.POST)
	public String updateProduct(Product p, HttpServletRequest request,Model model, ModelAndView mv, @RequestParam("oName") String[] oName,
			 @RequestParam("oPrice") int[] oPrice, @RequestParam("oAmount") int[] oAmount,
			@RequestParam(name = "uploadFile1", required = false) MultipartFile file1,
			@RequestParam(name = "uploadFile2", required = false) MultipartFile file2,
			@RequestParam(name = "uploadFile3", required = false) MultipartFile file3) {
//			System.out.println(b);
		// 멀티파트를 사용하려면 관련 라이브러리를 추가해야함
		// root-context.xml에 빈으로 등록해야함 이때 사이즈 지정 가능
		// 서버에 업로드 할 때 HttpServletRequest도 있어야함
		String root = request.getSession().getServletContext().getRealPath("resources");
		// resources 까지의 파일 위치를 나타냄
		String savePath = root + "\\product_uploadFiles";
		
		
		ArrayList<ProductAttachment> paList = new ArrayList<>();
		ArrayList<ProductOption> poList = new ArrayList<>();
		int fileLevelCheck = 1;
		
		for(int i=0; i<oName.length; i++) {
			ProductOption po = new ProductOption();
			po.setoName(oName[i]);
			po.setoPrice(oPrice[i]);
			po.setoAmount(oAmount[i]);
			po.setpId(p.getpId());
			poList.add(po);
		}
			
		if(!file1.getOriginalFilename().equals(""))
	
		{
			// 서버에 파일 등록 ( 폴더에 저장 )
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
			String renameFileName = saveFile(file1, request);
			System.out.println(renameFileName);
			if (renameFileName != null) { // 파일이 잘 저장된 경우
				ProductAttachment pa = new ProductAttachment();
				pa.setPaOriginName(file1.getOriginalFilename());
				pa.setPaChangeName(renameFileName);
				pa.setPaFileLevel(1);
				pa.setFilePath(savePath);
				pa.setpId(p.getpId());
				paList.add(pa);
			}
		}if(!file2.getOriginalFilename().equals(""))
		{
			// 서버에 파일 등록 ( 폴더에 저장 )
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
			String renameFileName = saveFile(file2, request);
			System.out.println(renameFileName);
			if (renameFileName != null) { // 파일이 잘 저장된 경우
				ProductAttachment pa = new ProductAttachment();
				pa.setPaOriginName(file2.getOriginalFilename());
				pa.setPaChangeName(renameFileName);
				pa.setPaFileLevel(2);
				pa.setpId(p.getpId());
				pa.setFilePath(savePath);
				paList.add(pa);
			}
		}if(!file3.getOriginalFilename().equals(""))
		{
			// 서버에 파일 등록 ( 폴더에 저장 )
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일
			String renameFileName = saveFile(file3, request);
			System.out.println(renameFileName);
			if (renameFileName != null) { // 파일이 잘 저장된 경우
				ProductAttachment pa = new ProductAttachment();
				pa.setPaOriginName(file3.getOriginalFilename());
				pa.setPaChangeName(renameFileName);
				pa.setFilePath(savePath);
				pa.setpId(p.getpId());
				pa.setPaFileLevel(3);
				paList.add(pa);
			}
		}
		
		System.out.println(p);
		for(int i=0; i<paList.size(); i++) {
			System.out.println(paList.get(i));
		}
		for(int i=0; i<poList.size(); i++) {
			System.out.println(poList.get(i));
		}
		int result = sService.updateProduct(p, paList, poList);

		if(result > 0) {
			return "redirect:sProduct.do";
		} else {
			model.addAttribute("msg", "수정에 실패했습니다");
			return "common/errorPage";
		}
	}
	
	
	
	
	@RequestMapping("storeName.do")
	   public void getReplyList(String S_BNUM, HttpServletResponse response) throws JsonIOException, IOException {
	      
	     
	         Document doc = null;
	      
	     
	      
	       try {
	         doc = Jsoup.connect("https://www.pps.go.kr/gpass/gpassCompany/selectCompanyInfo.do?bizNo="+S_BNUM).get();
	           System.out.println("회사명(한글)::"+doc.getElementById("corpNm").val());
	           System.out.println("회사명(한글)::"+doc.getElementById("suprAddr").val());
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	    Seller seller = new Seller();
		seller.setStoreName(doc.getElementById("corpNm").val());
		seller.setsCeoName(doc.getElementById("ceoNm").val());
		seller.setSbPhone(doc.getElementById("ceoMtelNo").val());
		seller.setSbAddress(doc.getElementById("suprAddr").val());

//	         <input id="corpNm" name="corpNm" type="hidden" value="주식회사 아프리카티비"/>
//	         <input id="engCorpNm" name="engCorpNm" type="hidden" value="AfreecaTV Co,.Ltd"/>
//	         <input id="estblshDt" name="estblshDt" type="hidden" value="1996-04-22"/>
//	         <input id="ordnrytmLbrerNum" name="ordnrytmLbrerNum" type="hidden" value="370"/>
//	         <input id="suprAddr" name="suprAddr" type="hidden" value="경기도 성남시 분당구 판교로228번길"/>
//	         <input id="suprDtlAddr" name="suprDtlAddr" type="hidden" value="15, 2동 2층(삼평동, 판교세븐밴처밸리 1단지)"/>
//	         <input id="hmpg" name="hmpg" type="hidden" value="www.afreecatv.com"/>
//	         <input id="ceoNm" name="ceoNm" type="hidden" value="서수길"/>
//	         <input id="ceoEmail" name="ceoEmail" type="hidden" value="zenith@afreecatv.com"/>
//	         <input id="ceoMtelNo" name="ceoMtelNo" type="hidden" value="010-7181-0524"/>

	      
	      response.setContentType("application/json; charset=utf-8");
	      
	      Gson gson = new Gson();
	
	      gson.toJson(seller, response.getWriter());
	}
	

	@RequestMapping(value="pUpdateView.do")
	public ModelAndView updateProductView(@RequestParam(value="pId") int pId, ModelAndView mv, HttpServletRequest request) {
		Product p = sService.selectProduct(pId);
		ArrayList<ProductAttachment> paList = sService.selectPa(p);
		ArrayList<ProductOption> poList = sService.selectPo(p);
		ArrayList<Category> cList = sService.selectcList();
		mv.addObject("cList", cList).addObject("p", p).addObject("paList", paList).addObject("poList", poList).setViewName("seller/product/updateProductForm");
		
		return mv;
	}
	
	@RequestMapping(value="pStreamingView.do")
	public ModelAndView pStreamingView(@RequestParam(value="pId") int pId, ModelAndView mv, HttpServletRequest request) {
		Product p = sService.selectProduct(pId);
		ArrayList<ProductAttachment> paList = sService.selectPa(p);
		ArrayList<ProductOption> poList = sService.selectPo(p);
		ArrayList<Category> cList = sService.selectcList();
		mv.addObject("cList", cList).addObject("p", p).addObject("paList", paList).addObject("poList", poList).setViewName("seller/product/updateProductForm");
		
		return mv;
	}
	
	@RequestMapping(value = "pStreaming.do", method = RequestMethod.POST)
	public String insertStreaming(Product p, HttpServletRequest request,Model model, ModelAndView mv, @RequestParam("oNo") int[] oNo,
			 @RequestParam("oPrice") int[] oPrice, @RequestParam("spTitle") String spTitle) {
		
		ArrayList<ProductAttachment> paList = new ArrayList<>();
		ArrayList<ProductOption> poList = new ArrayList<>();
			
		for(int i=0; i<paList.size(); i++) {
			System.out.println(paList.get(i));
		}
		for(int i=0; i<poList.size(); i++) {
			System.out.println(poList.get(i));
		}
		
		int result = sService.updateProduct(p, paList, poList);

		if(result > 0) {
			return "redirect:sProduct.do";
		} else {
			model.addAttribute("msg", "수정에 실패했습니다");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="findsPwd.do", method=RequestMethod.POST)
	public String  findPwd(Seller s, Model model, HttpServletRequest request) throws MessagingException {
		
		
		String key = new TempKey().getKey(10, false);
		s.setsPwd(key);
		
		int result = sService.newPaasword(s);
		
		MailHandler sendMail = new MailHandler(mailSender);
		
		sendMail.setSubject("[PANDA 비밀번호 찾기]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<h5 style='display:inline-block'>임시비밀번호 : </h5>").append(s.getsPwd()).toString());
		try {
			sendMail.setFrom("dkj01043@gmail.com", "관리자");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMail.setTo(s.getsEmail());
		sendMail.send();
		
		return "home";
	 
		
	}
	
}
