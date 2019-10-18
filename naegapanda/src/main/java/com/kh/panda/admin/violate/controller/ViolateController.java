package com.kh.panda.admin.violate.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

	private static Logger logger = LoggerFactory.getLogger(ViolateController.class);
	
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
	
		/*
		 * if(!file.getOriginalFilename().equals("")) {
		 * 
		 * String renameFileName = saveFile(file, request); if(renameFileName != null) {
		 * // 파일이 잘 저장된 경우 v.setvPhoto(renameFileName); }
		 * 
		 * }
		 */
		
		int result = vService.insertViolate(v);
		
		
		if(result > 0) {
			return "redirect:finishViolate.do";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	
	
public String saveFile(MultipartFile file, HttpServletRequest request) {
												//session을 쓰려구
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\vUpload";
		
		File folder = new File(savePath); // 저장될 폴더
		
		if(!folder.exists()) { 	// 폴더가 없다면
			folder.mkdirs();	// 폴더 생성해라
		}
		
		String originalFileName = file.getOriginalFilename(); // 원본명(확장자)
		
		// 파일명 수정작업 --> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) // 년월일시분초
							  + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 실제 저장될 경로 savePath + 저장하고자하는 파일명 renameFileName
		String renamePath = savePath + "\\" + renameFileName; 
		
		
	
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		

		return renameFileName; // 수정명 반환
		
	}



	
	
	
	 @RequestMapping("vdetailView.do") 
	 public ModelAndView ViolateDetailView(ModelAndView mv, int vNo) { 
		 
		 Violate v = vService.violateDetail(vNo);
		System.out.println("vNo:"+vNo);
		System.out.println("v"+v);
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
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	/*
	 * @RequestMapping("testView.do") public String ViolateListView() { return
	 * "admin/violate/ViolateListView2"; }
	 */
		
		
		@RequestMapping("violateView.do")
		public ModelAndView tselectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
			int listCount = vService.getListCount();

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Violate> list = vService.selectList(pi);
		
		 System.out.println("list:" + list); 
		 System.out.println("listcount:" + listCount);
		 
			
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/violate/ViolateListView");
			// 객체                                                                                         경로로반환한거당
			return mv;
			
		}
	

}
