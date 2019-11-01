package com.kh.panda.admin.pmanager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.pmanager.model.service.PmanagerService;
import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.admin.vmessage.model.service.VmessageService;
import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class PmanagerController {

	@Autowired
	private PmanagerService pmService;
	
	
	 @Autowired private VmessageService vmService;
	
	
	
	
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
	public ModelAndView selectList(ModelAndView mv, String cName2, 
								   @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								   @RequestParam(value="currentPage2", required=false, defaultValue="1") int currentPage2) {
		
		int listCount1 = pmService.getListCount1(cName2);
		int listCount2 = pmService.getListCount2(cName2);
		
		PageInfo pi = Pagination.getPageInfo3(currentPage, listCount1);
		PageInfo pi2 = Pagination.getPageInfo4(currentPage2, listCount2);
		
		ArrayList<Pmanager> pmlist = pmService.selectList(pi, cName2);
		ArrayList<Pmanager> pmxlist = pmService.selectxList(pi2, cName2);
		
		//System.out.println(pi);
		System.out.println(pi2);
		
		//System.out.println("판매관리 리스트"+pmlist);
		System.out.println("판매중지 리스트"+pmxlist);
		
		mv.addObject("pi", pi).addObject("pi2", pi2).addObject("pmlist", pmlist).addObject("pmxlist", pmxlist).setViewName("admin/pmanager/pmListView");
		
		return mv;
		
	}
	
	@RequestMapping("pmViolateList.do")
	public ModelAndView pmViolateList(ModelAndView mv, int pId, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		
		int listCount3 = pmService.getListCount3();
		
		PageInfo pi = Pagination.getPageInfo5(currentPage, listCount3);
		
		//System.out.println(pi);
		
		ArrayList <Pmanager> pmVlist = pmService.pmViolateList(pi, pId);
		
		//System.out.println("피엠븨리스트" + pmVlist);
		
		
		mv.addObject("pi", pi).addObject("pmVlist", pmVlist).addObject("pId", pId).setViewName("admin/pmanager/pmViolateListView");
		
		return mv;
	}
	
	@RequestMapping("pmstop.do")
	public String pmStop(int pId, int vNo , int sNo, HttpServletRequest request) {
		
		int result = pmService.pmStop(pId);
		
		
		  Vmessage vm = new Vmessage();
		  
		  vm.setvNo(vNo); vm.setpId(pId); vm.setsNo(sNo);
		 
		  int result2 = vmService.vmessageStautsY(vm);
		 
		
		
		
		System.out.println("판매정지"+result);
		
		if(result > 0) {
			return "redirect:categoryView.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("pmrestart.do")
	public String pmrestart(int pId, int sNo , int vNo, HttpServletRequest request) {
		
		int result = pmService.pmrestart(pId);
		
		//System.out.println("판매재개"+result);
		
		
		  Vmessage vm = new Vmessage();
		  vm.setvNo(vNo); vm.setpId(pId); vm.setsNo(sNo);
		  int result2 = vmService.vmessageStautsN(vm);
		 
		
		
		
		if(result > 0) {
			return "redirect:categoryView.do";
		}else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("pmvdetailView.do")
	public ModelAndView violateDetailView(ModelAndView mv, int vNo) {
		
		System.out.println("신고디테일"+vNo);
		
		Violate v = pmService.violateDetailView(vNo);
		
		System.out.println("신고디테일"+v);
		
		if(v != null) {
			mv.addObject("v", v).setViewName("admin/violate/ViolateDetailView");
		}else {
			mv.addObject("msg", "신고 상세조회 실패@@").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("approvalList.do")
	public ModelAndView approvalList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		int listCount = pmService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList <Pmanager> aplist = pmService.approvalList(pi);
		
		//System.out.println(aplist);
		
		mv.addObject("pi", pi).addObject("aplist", aplist).setViewName("admin/pmanager/approvalListView");
		return mv;
	}
	
	@RequestMapping("approval.do")
	public String approval(int pId, HttpServletRequest request) {
		
		System.out.println(pId);
		
		int result = pmService.approval(pId);
		
		//System.out.println(result);
		
		if(result > 0) {
			return "redirect:approvalList.do";
		}else {
			return "common/errorPage";
		}
		
		
		
	}
}
