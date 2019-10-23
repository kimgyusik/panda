package com.kh.panda.admin.board.qna.seller.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.board.qna.seller.model.service.SQnaService;
import com.kh.panda.admin.board.qna.seller.model.vo.SAnswer;
import com.kh.panda.admin.board.qna.seller.model.vo.SQna;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class SQnaController {
	
	@Autowired
	private SQnaService sqService;
	
	@RequestMapping("sqlist.do")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		int listCount = sqService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<SQna> qlist = sqService.selectList(pi);
		ArrayList<SAnswer> alist = sqService.selectSAList(); 
		
		//System.out.println(qlist);
		//System.out.println(alist);
		
		mv.addObject("pi", pi).addObject("qlist", qlist).addObject("alist", alist).setViewName("admin/board/sqnaListView");
		
		return mv;
	}
	
	@RequestMapping("sqinsertView.do")
	public String sqnaInsertView() {
		return "admin/board/sqnaInsertForm";
	}
	
	@RequestMapping("sqinsert.do")
	public String insertSQna(SQna q, HttpServletRequest request, Model model) {
		
		//System.out.println(q);
		
		int result = sqService.insertSQna(q);
		
		//System.out.println(result);
		
		if(result > 0) {
			return "redirect:sqlist.do";
		}else {
			model.addAttribute("msg", "게시판 작성 실패@@");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("sqdetail.do")
	public ModelAndView sqnaDetail(int sqId, ModelAndView mv) {
		
		SQna q = sqService.sqnaDetail(sqId);
		SAnswer a = sqService.sanswerDetail(sqId);
		
		//System.out.println(q);
		//System.out.println(q.getmName());
		//System.out.println("디테일"+a);
		
		if(q != null) {
			mv.addObject("q",q).addObject("a",a).setViewName("admin/board/sqnaDetailView");
		}else {
			mv.addObject("msg", "문의게시판 상세조회 실패!!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("squpdateView.do")
	public ModelAndView sqnaUpdateView(SQna q, ModelAndView mv) {
		
		if(q != null) {
			mv.addObject("q", q).setViewName("admin/board/sqnaUpdateForm");
		}else {
			System.out.println("수정폼 불러오기 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("squpdate.do")
	public String sqnaUpdate(SQna q, HttpServletRequest request, Model model) {
		
		//System.out.println("수정하기 버튼 누르면"+q);
		
		int result = sqService.updateSQna(q);
		
		//System.out.println(result);
		
		if(result > 0) {
			return "redirect:sqlist.do";
		}else {
			model.addAttribute("msg", "문의 게시판 수정 실패!!");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("sqdelete.do")
	public String deleteSQna(int sqId, HttpServletRequest request){
		
		//System.out.println(uqId);
		
		int result = sqService.deleteSQna(sqId);
		int result2 = sqService.deleteSAnswer(sqId);
		
		if(result > 0 && result2 > 0) {
			return "redirect:sqlist.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("sainsertView.do")
	public ModelAndView sanswerInsertView(int sqId, ModelAndView mv ) {
		
		SQna q = sqService.sqnaDetail(sqId);
		
		//System.out.println("회원답변 "+q);
		
		if(q != null) {
			mv.addObject("q", q).setViewName("admin/board/saInsertForm");
		}else {
			mv.addObject("msg", "회원 서비스 문의 조회 실패!").setViewName("common/errorPage");
		}
		
		return mv;
		
		
	}
	
	@RequestMapping("sainsert.do")
	public String insertSAnswer(SAnswer a, HttpServletRequest request, Model model) {
		
		System.out.println("인서트"+a);
		
		int result = sqService.insertSAnswer(a);
		
		if(result > 0) {
			return "redirect:sqlist.do";
		}else {
			model.addAttribute("msg", "회원 문의 답변 실패!!");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("sadelete.do")
	public String deleteSAnswer(int sqId, HttpServletRequest request) {
		
		int result = sqService.deleteSAnswer(sqId);
		
		if(result > 0) {
			return "redirect:sqlist.do";
		}else {
			return "common/errorPage";
		}
	}
	

}
