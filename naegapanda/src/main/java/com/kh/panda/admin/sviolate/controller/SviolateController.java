package com.kh.panda.admin.sviolate.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.sviolate.model.service.SviolateService;
import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class SviolateController {

	@Autowired
	private SviolateService svService;
	
	@RequestMapping("sViolateAllList.do")
	public ModelAndView selectSviolateList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
	
		int listCount = svService.getAllListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sviolate> list = svService.selectAllList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/sviolate/sViolateAllListView");
		// 객체                                                                                         경로로반환한거당
		return mv;
		
	}
	
	
	@RequestMapping("sViolatePersonalList.do")
	public ModelAndView selectPviolateList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, int sNo) {
		
		int listCount = svService.getPersonalListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sviolate> list = svService.selectPersonalList(pi, sNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/sviolate/sViolatePersonalListView");
		// 객체                                                                                         경로로반환한거당
		return mv;
		
	}
}
