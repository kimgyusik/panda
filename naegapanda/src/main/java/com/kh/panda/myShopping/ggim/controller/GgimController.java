package com.kh.panda.myShopping.ggim.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.ggim.model.service.GgimService;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Controller
public class GgimController {
	
	@Autowired
	private GgimService ggService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 내 찜 리스트 조회
	@RequestMapping("ggimList.gg")
	public ModelAndView selectGgimList(ModelAndView mv, HttpSession session/*, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage*/) {
		
//		int listCount = gService.getListCount(getmNo(session));
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage);
//		ArrayList<Ggim> list = gService.selectList(pi, getmNo(session));
//		mv.addObject("pi", pi);
		
		ArrayList<Ggim> list = ggService.selectGgimList(getmNo(session));
		
		ArrayList<String> category = new ArrayList<String>();
       for (int i = 0; i < list.size(); i++) {
           if (!category.contains(list.get(i).getCategory2())) {
        	   category.add(list.get(i).getCategory2());
           }
       }
		
		mv.addObject("category", category);
		mv.addObject("list", list);
		mv.setViewName("myShopping/ggim/ggimList");
		
		return mv;
	}
	
	// 찜하기 토글 처리
	@ResponseBody
	@RequestMapping(value="changeGgim.gg")
	public String changeGgim(String pId, int flag, HttpSession session /*, HttpServletResponse response*/) throws IOException {
		
		Ggim ggim = new Ggim();
		
		ggim.setmNo(getmNo(session));
		ggim.setpId(Integer.parseInt(pId));
		
		int result = ggService.changeGgim(ggim, flag);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 찜 취소 처리
	@RequestMapping("deleteGgim.gg") // ajax로 처리하려면 리턴 void로 
	public String deleteGgim(int pId, HttpServletRequest request, HttpSession session) {
		
		Ggim ggim = new Ggim();
		ggim.setmNo(getmNo(session));
		ggim.setpId(pId);
		
		int result = ggService.deleteGgim(ggim);
		
		if(result > 0) {
			return "redirect:ggimList.gg";
		}else {
			return "common/errorPage";
		}
	}
	
	// 찜 추가
	@RequestMapping("addGgim.gg") // ajax로 처리하려면 리턴 void로 
	public String addGgim(int pId, HttpServletRequest request, HttpSession session) {
		
		Ggim ggim = new Ggim();
		ggim.setmNo(getmNo(session));
		ggim.setpId(pId);
		
		int result = ggService.addGgim(ggim);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 찜 갯수(메인메뉴바)
	@RequestMapping("currentGgim.gg")
	public void currentGgim(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {

		int count = ggService.getListCount(getmNo(session));
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(count, response.getWriter());
		
	}

}
