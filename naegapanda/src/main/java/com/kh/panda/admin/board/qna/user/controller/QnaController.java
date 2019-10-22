package com.kh.panda.admin.board.qna.user.controller;

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

import com.kh.panda.admin.board.qna.user.model.service.QnaService;
import com.kh.panda.admin.board.qna.user.model.vo.Qna;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;
	
	@RequestMapping("qlist.do")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		int listCount = qService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Qna> list = qService.selectList(pi);
		
		//System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/board/qnaListView");
		
		return mv;
	}
	
	@RequestMapping("qinsertView.do")
	public String qnaInsertView() {
		return "admin/board/qnaInsertForm";
	}
	
	@RequestMapping("qinsert.do")
	public String insertQna(Qna q, HttpServletRequest request, Model model) {
		
		//System.out.println(q);
		
		int result = qService.insertQna(q);
		
		//System.out.println(result);
		
		if(result > 0) {
			return "redirect:qlist.do";
		}else {
			model.addAttribute("msg", "게시판 작성 실패@@");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("qdetail.do")
	public ModelAndView qnaDetail(int uqId, ModelAndView mv) {
		
		Qna q = qService.qnaDetail(uqId);
		
		//System.out.println(q);
		
		if(q != null) {
			mv.addObject("q",q).setViewName("admin/board/qnaDetailView");
		}else {
			mv.addObject("msg", "문의게시판 상세조회 실패!!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("qupdateView.do")
	public ModelAndView qnaUpdateView(Qna q, ModelAndView mv) {
		
		if(q != null) {
			mv.addObject("q", q).setViewName("admin/board/qnaUpdateForm");
		}else {
			System.out.println("수정폼 불러오기 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("qupdate.do")
	public String qnaUpdate(Qna q, HttpServletRequest request, Model model) {
		
		System.out.println("수정하기 버튼 누르면"+q);
		
		int result = qService.updateQna(q);
		
		System.out.println(result);
		
		if(result > 0) {
			return "redirect:qlist.do";
		}else {
			model.addAttribute("msg", "문의 게시판 수정 실패!!");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("qdelete.do")
	public String deleteQna(int uqId, HttpServletRequest request){
		
		System.out.println(uqId);
		
		int result = qService.deleteQna(uqId);
		
		if(result > 0) {
			return "redirect:qlist.do";
		}else {
			return "common/errorPage";
		}
	}
	
	
	
	
	

}
