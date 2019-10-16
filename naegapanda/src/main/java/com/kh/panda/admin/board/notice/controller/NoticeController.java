package com.kh.panda.admin.board.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.board.notice.model.service.NoticeService;
import com.kh.panda.admin.board.notice.model.vo.Notice;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		// 공지사항 총 갯수
		int listCount = nService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/board/notice/noticeListView");
		
		return mv;
		
	}
	
}
