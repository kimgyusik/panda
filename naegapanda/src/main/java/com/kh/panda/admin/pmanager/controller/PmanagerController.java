package com.kh.panda.admin.pmanager.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.pmanager.model.service.PmanagerService;
import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class PmanagerController {

	@Autowired
	private PmanagerService pmService;
	
	@RequestMapping("categoryView.do")
	public ModelAndView categoryView(ModelAndView mv, Pmanager pm) {
		if(pm != null) {
			mv.addObject("pm", pm).setViewName("admin/pmanager/categoryViewForm");
		}else {
			mv.addObject("msg", "카테고리별 리스트 불러오기 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("pmlist.do")
	public ModelAndView selectList(ModelAndView mv, String cName2, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage ) {
		
		int listCount = pmService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Pmanager> pmlist = pmService.selectList(pi, cName2);
		
		//System.out.println(pmlist);
		
		mv.addObject("pi", pi).addObject("pmlist", pmlist).setViewName("admin/pmanager/pmListView");
		
		return mv;
		
	}
	
	
}
