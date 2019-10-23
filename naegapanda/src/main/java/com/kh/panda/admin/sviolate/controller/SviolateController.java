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
	
	@RequestMapping("sViolateList.do")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
	
		int listCount = svService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sviolate> list = svService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/sviolate/sViolateListView");
		// 객체                                                                                         경로로반환한거당
		return mv;
		
	}
}
