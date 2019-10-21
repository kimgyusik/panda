package com.kh.panda.admin.board.qna.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	
	
	
	
	
	

}
