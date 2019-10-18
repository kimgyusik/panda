package com.kh.panda.admin.vmessage.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.vmessage.model.service.VmessageService;
import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;

@Controller
public class VmessageController {
	private static Logger logger = LoggerFactory.getLogger(VmessageController.class);
	
	@Autowired
	private VmessageService vmService;
	
	@RequestMapping("vmessage.do")
	public ModelAndView vmessageList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		int listCount = vmService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		ArrayList<Vmessage> list = vmService.selectList(pi);
	
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("admin/vmessage/VmessageListView");
		
		return mv;
	}
	
}
