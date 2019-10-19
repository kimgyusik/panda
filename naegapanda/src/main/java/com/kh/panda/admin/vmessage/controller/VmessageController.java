package com.kh.panda.admin.vmessage.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.vmessage.model.service.VmessageService;
import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.kh.panda.seller.model.vo.Seller;

@SessionAttributes("loginUser")
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
	
	@RequestMapping("sellervmessage.do")
	public ModelAndView SellervmessageList(HttpSession session, ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		int sNo = ((Seller)(session.getAttribute("loginSeller"))).getsNo();
		System.out.println(sNo);
		
//		String idTest = session.getAtt
		int listCount = vmService.getSellerListCount(sNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		ArrayList<Vmessage> list = vmService.selectSellerList(pi,sNo);
		System.out.println(list);
		
		mv.addObject("pi",pi).addObject("list",list).addObject("sNo",sNo).setViewName("admin/vmessage/SellerVmessageListView");
		
		return mv;
	}
	
	@RequestMapping("vmDetailView.do")
	public ModelAndView VmessageDetailView(ModelAndView mv, int vmNo, HttpSession session) {
		
		int sNo = ((Seller)(session.getAttribute("loginSeller"))).getsNo();
		if(sNo > 0) {			
			Vmessage vm = vmService.vmessageDetail(vmNo,sNo);
		}
		Vmessage vm = vmService.vmessageDetail(vmNo);
		
		mv.addObject("vm",vm).setViewName("admin/vmessage/VmessageDetailView");
		
		return mv;
	}
	
}
