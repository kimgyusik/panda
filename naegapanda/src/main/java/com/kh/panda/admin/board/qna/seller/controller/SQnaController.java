package com.kh.panda.admin.board.qna.seller.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.board.qna.seller.model.service.SQnaService;
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
		
		ArrayList<SQna> list = sqService.selectList(pi);
		
		System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/board/sqnaListView");
		
		return mv;
	}
}
