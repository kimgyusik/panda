package com.kh.panda.admin.vmessage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.admin.violate.model.vo.Violate;
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
	public ModelAndView vmessageList(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		int listCount = vmService.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Vmessage> list = vmService.selectList(pi);

		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/vmessage/VmessageListView");

		return mv;
	}

	@RequestMapping("sellervmessage.do")
	public ModelAndView SellervmessageList(HttpSession session, ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		int sNo = ((Seller) (session.getAttribute("loginSeller"))).getsNo();

		int listCount = vmService.getSellerListCount(sNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Vmessage> list = vmService.selectSellerList(pi, sNo);

		mv.addObject("pi", pi).addObject("list", list).addObject("sNo", sNo)
				.setViewName("admin/vmessage/SellerVmessageListView");

		return mv;
	}

	@RequestMapping("vmDetailView.do")
	public ModelAndView VmessageDetailView(ModelAndView mv, int vmNo) {

		Vmessage vm = vmService.vmessageDetail(vmNo);
		System.out.println("2222222222222222222222222222222");

		mv.addObject("vm", vm).setViewName("admin/vmessage/VmessageDetailView");

		return mv;
	}

	@RequestMapping("vmSellerDetailView.do")
	public ModelAndView VmessageSellerDetailView(ModelAndView mv, int vmNo, HttpSession session) {

		int sNo = ((Seller) (session.getAttribute("loginSeller"))).getsNo();
		System.out.println(sNo);
		System.out.println("11111111111111111111111111111111");

		Vmessage vm = vmService.vmessageSellerDetail(vmNo, sNo);
		System.out.println(vm);

		mv.addObject("vm", vm).setViewName("admin/vmessage/VmessageDetailView");

		return mv;
	}

	@RequestMapping("vmInsert.do")
	public String VmessageInsert(Vmessage vm, HttpServletRequest request, Model model, @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				vm.setVmOriginalFileName(file.getOriginalFilename());
				vm.setVmRenameFileName(renameFileName);
			}
		
		}
		
		int result = vmService.insertVmessage(vm);
		
		return "redirect:vmessage.do";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\vmupload";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String vmOriginalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + vmOriginalFileName.substring(vmOriginalFileName.lastIndexOf("."));
		
		String renamePath = savePath + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}


}
