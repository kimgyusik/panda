package com.kh.panda.myShopping.ggim.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.common.PageInfo;
import com.kh.panda.common.Pagination;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.ggim.model.service.GgimService;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Controller
public class GgimController {
	
	@Autowired
	private GgimService gService;
	
	@RequestMapping("ggimList.gg")
	public ModelAndView selectList(ModelAndView mv, HttpSession session/*, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage*/) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).get();
		
//		int listCount = gService.getListCount(mNo);
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage);
//		ArrayList<Ggim> list = gService.selectList(pi, mNo);
//		mv.addObject("pi", pi);
		
		
		ArrayList<Ggim> list = gService.selectList(mNo);
		
		ArrayList<String> category;
		
		for(Ggim g : list) {
			for(String s : category) {
				if(s.equals(g.getCategory2()))
				{
					break;
				}
				category.add(g.getCategory2());
			}
		}
		
		System.out.println(category);
		
		// 이미지 가져와야함
		
		mv.addObject("category", category);
		mv.addObject("list", list);
		mv.setViewName("찜뷰");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="changeGgim.gg")
	public String changeGgim(int pId, int flag, HttpSession session /*, HttpServletResponse response*/) throws IOException {
		
		// flag 0이나 1로 넘길건지 선택해야함
		
		int mNo = ((Member)session.getAttribute("loginUser")).get();
		
		Ggim ggim = new Ggim();
		ggim.setmNo(mNo);
		ggim.setpId(pId);
		
		int result = gService.changeGgim(ggim, flag);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// ajax로 처리하려면 리턴 void로 
	@RequestMapping("deleteGgim.gg")
	public String deleteGgim(int pId, HttpServletRequest request, HttpSession session) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).get();
		
		Ggim ggim = new Ggim();
		ggim.setmNo(mNo);
		ggim.setpId(pId);
		
		int result = gService.deleteGgim(ggim);
		
		if(result > 0) {
			return "redirect:ggimList.gg";
		}else {
			return "common/errorPage"; // 에러페이지 설정
		}
	}

}
