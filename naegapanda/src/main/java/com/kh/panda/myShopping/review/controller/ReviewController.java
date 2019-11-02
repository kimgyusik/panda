package com.kh.panda.myShopping.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.payment.model.service.PaymentService;
import com.kh.panda.myShopping.payment.model.vo.Payment;
import com.kh.panda.myShopping.review.model.service.ReviewService;
import com.kh.panda.myShopping.review.model.vo.Commend;
import com.kh.panda.myShopping.review.model.vo.Reply;
import com.kh.panda.myShopping.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reService;
	@Autowired
	private PaymentService paService;
	
	// 세션 유저 번호 받아오는 로직
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 내 리뷰 리스트 조회
	@RequestMapping("myReviewList.re")
	public ModelAndView selectMyReviewList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Review> list = reService.selectMyReviewList(getmNo(session));
		ArrayList<Payment> list2 = paService.myPaymentList(getmNo(session));
		
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.setViewName("myShopping/review/myReviewList");
		
		return mv;
	}
	
	
	// 상품 리뷰 리스트 조회(비동기)
	@RequestMapping("prodReviewList.re")
	public void selectProdReviewList(int pId, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Review> list = reService.selectProdReviewList(pId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
	}
	
	
	// 리뷰 상세 조회(디컴일듯)
	@RequestMapping("selectReview.re")
	public ModelAndView selectReview(int rId, ModelAndView mv) {
		
		Review r = reService.selectReview(rId);
		
		if(r != null) {
			mv.addObject("r", r)
			  .setViewName("review/selectReview");
			
		}else {
			mv.addObject("msg", "리뷰 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	
	// 작성 가능 리뷰 리스트
	@RequestMapping("addAbleReview.re")
	public ModelAndView addAbleReview(ModelAndView mv, HttpSession session) {
		
		//ArrayList<Payment> list = reService.addAbleReview(getmNo(session));
		
		ArrayList<Payment> list = new ArrayList<>();
		
		Date date = new Date();
		
		Payment p = new Payment();
	
		p.setpName("맛있는과자");
		p.setoName("1kg x 10박스");
		p.setpId(11);
		p.setPayId(13);
		p.setStoreName("이지몰");
		p.setPayDate(date);
		p.setPaChangeName("blog_1.jpg");
		list.add(p);
		
		Payment p2 = new Payment();

		p2.setpName("매운라면");
		p2.setoName("24242개");
		p2.setpId(22);
		p2.setPayId(24);
		p2.setPayDate(date);
		p2.setStoreName("라면상점");
		p2.setPaChangeName("view_5.jpg");
		list.add(p2);
		
		mv.addObject("list", list);
		mv.setViewName("myShopping/review/addAbleReview");
		
		return mv;
	}
	
	
	// 리뷰 추가 처리
	@RequestMapping("addReview.re")
	public String addReview(Review r, HttpServletRequest request, Model model,
							  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		System.out.println("로그로그");
		if(file!= null && !file.getOriginalFilename().equals("")) {
			
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				r.setrImage(renameFileName);
			}
		}
		
		int result = reService.addReview(r);
		
		if(result > 0) {
			return "redirect:myReviewList.re";
		}else {
			model.addAttribute("msg", "리뷰 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 첨부파일 저장 로직
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\review_uploadFiles"; 
		
		File folder = new File(savePath); 
		
		if(!folder.exists()) { 
			folder.mkdirs(); 
		}
		
		String originalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
							  + originalFileName.substring(originalFileName.lastIndexOf("."));

		String renamePath = savePath + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}
	
	
	// 리뷰 업데이트 처리
	@RequestMapping("updateReview.re")
	public String updateReview(Review r, HttpServletRequest request, Model model,
							  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		if(file!= null && !file.getOriginalFilename().equals("")) {
			
			// 기존에 저장된 사진이 있다면 삭제후 새로 저장하게 됨
			Review rv = reService.selectReview(r.getrId());
			
			if(rv.getrImage() != null) {
				deleteFile(rv.getrImage(), request);
			}
			
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				r.setrImage(renameFileName);
			}
		}
		
		System.out.println(r.toString());
		int result = reService.updateReview(r);
		
		if(result > 0) {
			return "redirect:myReviewList.re";
		}else {
			model.addAttribute("msg", "리뷰 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	
	// 리뷰 삭제 처리
	@ResponseBody
	@RequestMapping("deleteReview.re")
	public String deleteReview(int rId, HttpServletRequest request) {
		
		Review r = reService.selectReview(rId);
		
		if(r.getrImage() != null) {
			deleteFile(r.getrImage(), request);
		}
		
		int result = reService.deleteReview(rId);
		
		if(result > 0 ) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 첨부파일 삭제 로직
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\review_uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	// 리뷰 좋아요/취소 토글 처리(비동기)
	@ResponseBody
	@RequestMapping(value="changeCommend.re")
	public String changeCommend(int rId, HttpSession session) throws IOException {
				
		Commend c = new Commend();
		c.setmNo(getmNo(session));
		c.setrId(rId);
		
		int result = reService.changeCommend(c);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	// 리뷰에 달려있는 리플 가져오기(비동기)
	@RequestMapping("replyList.re")
	public void getReplyList(int rId, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Reply> list = reService.getReplyList(rId);

		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 리플 추가(비동기)
	@ResponseBody
	@RequestMapping("addReply.re")
	public String addReply(Reply r, HttpSession session) {
		
		r.setmNo(getmNo(session));
		
		int result = reService.addReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 리플 삭제(비동기)
	@ResponseBody
	@RequestMapping("deleteReply.re")
	public String deleteReply(int rrId, HttpSession session) {
		
		int result = reService.deleteReply(rrId);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 리뷰 조회수 증가
	@ResponseBody
	@RequestMapping("increaserCount.re")
	public String increaserCount(int rId) {	
		int result = reService.increaserCount(rId);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	

}
