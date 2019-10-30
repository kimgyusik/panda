package com.kh.panda.admin.sviolate.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.sviolate.model.service.SviolateService;
import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.admin.violate.model.service.ViolateService;
import com.kh.panda.admin.violate.model.vo.SearchCondition;
import com.kh.panda.admin.violate.model.vo.Violate;
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
	public ModelAndView selectPviolateList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, int sNo, String sName) {
		
		int listCount = svService.getPersonalListCount(sNo);
		System.out.println("Personal:");
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sviolate> list = svService.selectPersonalList(pi, sNo);
		System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("sName",sName).addObject("sNo",sNo).setViewName("admin/sviolate/sViolatePersonalListView");
		// 객체                                                                                         경로로반환한거당
		return mv;
		
	}
	 @RequestMapping("svdetailView.do") 
	 public ModelAndView ViolateDetailView(ModelAndView mv, int vNo) { 
		 
		 Violate v = svService.violateDetail(vNo);
		 if(v != null) {
			 mv.addObject("v",v).setViewName("admin/violate/ViolateDetailView");
		 }else {
			/* mv.addObject("msg","글이 없습니다...").setViewName("common/errorPage");   흠 필요없어!!!!!!!!*/
		 }
		 
		 return mv;
	}
	 
	 @RequestMapping("sellerDelete.do")
	 public ModelAndView sellerDelete(ModelAndView mv, int sNo) {
		 System.out.println(sNo);
		 int result = svService.sellerDelete(sNo);
		 System.out.println(result);
		 mv.setViewName("admin/sviolate/sViolateAllListView");
		 return mv;
	 }
	 
	 @RequestMapping("sviolateSearch.do")
	 public ModelAndView sviolateSearch(ModelAndView mv, String condition, String keyword, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		 System.out.print("keyword:");
		 System.out.println(keyword);
		 
		 SearchCondition sc = new SearchCondition();
		 
			if(condition.equals("sName")) {
				System.out.println("sName");
				sc.setsName(keyword);
			}else if(condition.equals("storeName")) {
				System.out.println("storeName");	
				sc.setStoreName(keyword);
			}else {
				System.out.println("sStatus");	
				sc.setsStatus(keyword);
			}
			
			System.out.println(sc);
			
			
			int listCount = svService.getAllListCount(sc);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Sviolate> list = svService.selectAllList(sc,pi);
			
			
			
			
			mv.addObject("pi", pi).addObject("list", list).addObject("condition",condition).addObject("keyword",keyword).addObject("sc",sc).setViewName("admin/sviolate/sViolateAllListView");
			// 객체                                                                                         경로로반환한거당
			return mv;
	 }
}
