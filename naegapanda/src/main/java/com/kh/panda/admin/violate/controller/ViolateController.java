package com.kh.panda.admin.violate.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.violate.model.service.ViolateService;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class ViolateController {
	
	@Autowired
	private ViolateService vService;
	
	
	@RequestMapping("vlist.do")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
	
		int listCount = vService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Violate> list = vService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/violate/ViolateListView");
		// 객체                                                                                         경로로반환한거당
		return mv;
		
	}
	
	@RequestMapping("vinsertView.do")
	public String ViolateInsertView() {
		return "admin/violate/ViolateInsertForm";
	}
	
	@RequestMapping("vinsert.do")
	public String insertViolate(Violate v, HttpServletRequest request, Model model, 
			@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")){
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				v.setvOriginalFileName(file.getOriginalFilename());
				v.setvRenameFileName(renameFileName);
			}
		}
		
		int result = vService.insertViolate(v);

		return "redirect:finishViolate.do";
		
		
	}
	
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\vupload";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String vOriginalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + vOriginalFileName.substring(vOriginalFileName.lastIndexOf("."));
		
		String renamePath = savePath + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}


	
	 @RequestMapping("vdetailView.do") 
	 public ModelAndView ViolateDetailView(ModelAndView mv, int vNo) { 
		 
		 Violate v = vService.violateDetail(vNo);
		 if(v != null) {
			 mv.addObject("v",v).setViewName("admin/violate/ViolateDetailView");
		 }else {
			/* mv.addObject("msg","글이 없습니다...").setViewName("common/errorPage");   흠 필요없어!!!!!!!!*/
		 }
		 
		 return mv;
	}
	 
	 @RequestMapping("finishViolate.do")
	 public String FinishViolateView() {
		 return "admin/violate/FinishViolateView";
	 }
	
	 
	 
	 
	 
		
		
		@RequestMapping("violateView.do")
		public ModelAndView tselectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
			int listCount = vService.getListCount();

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Violate> list = vService.selectList(pi);
			
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/violate/ViolateListView");
			// 객체                                                                                         경로로반환한거당
			return mv;
			
		}
		
		@RequestMapping("vmessageInsertView.do")
		public ModelAndView VmessageInsertView(ModelAndView mv, int vNo) {
			
			Violate v = vService.violateDetail(vNo);
			mv.addObject("v",v).setViewName("admin/vmessage/VmessageInsertView");
			
			return mv;
		}
	

}
