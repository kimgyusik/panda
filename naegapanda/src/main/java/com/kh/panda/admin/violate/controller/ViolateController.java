package com.kh.panda.admin.violate.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.violate.model.service.ViolateService;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class ViolateController {

	@Autowired
	private ViolateService vService;
	
	
	
	@RequestMapping("vlist.do")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
	
		int listCount = vService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Violate> list = vService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/violate/ViolateListView.jsp");
		
		return mv;
		
	}
	
	@RequestMapping("vinsertView.do")
	public String ViolateInsertView() {
		return "admin/violate/ViolateInsertForm";
	}
	

}
